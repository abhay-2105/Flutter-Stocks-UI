import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stock/widgets/portfolio_stock_detail.dart';

class Portfolio extends StatelessWidget {
  Portfolio({super.key});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  double investedAmt = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 80,
              alignment: Alignment.topCenter,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Holdings',
                          style: TextStyle(
                              color: Colors.grey.shade300, fontSize: 14),
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 7,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Positions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: StreamBuilder(
                        stream: firestore
                            .collection('stocks')
                            .doc('LpDBuSHAXyMx9trxYaCY')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            investedAmt = snapshot.data!['investedAmt'];
                          }
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Invested',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        investedAmt.toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Current',
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            investedAmt == 0
                                                ? '0      '
                                                : (investedAmt - 2931.75)
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.grey.shade300,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Text(
                                            '-21.62%',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'P&L',
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '-2931.75',
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '-21.62%',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 93),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.menu,
                    size: 20,
                    color: Colors.deepPurple,
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.people,
                    size: 20,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Family',
                    style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.circle_outlined,
                    size: 20,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Analytics',
                    style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('stocks')
                .doc('SxBhgUXBAIPpyzOoHBSO')
                .collection('portfolio')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              if (data.isEmpty) {
                return const Center(
                  child: Text(
                    'When you buy a stock it will appear here.',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                );
              }
              return ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                titlePadding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20, bottom: 20),
                                backgroundColor: Colors.grey.shade300,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data[index]['stockName'],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                    Text(
                                      'Rs. ${data[index]['price'].toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: const [
                                        Expanded(
                                            child: Text(
                                          'Quantity',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )),
                                        Text('Amount invested',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(data[index]['quantity']
                                              .toString()),
                                        ),
                                        Text(
                                            'Rs. ${data[index]['invested'].toStringAsFixed(2)}')
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        try {
                                          firestore
                                              .collection('stocks')
                                              .doc('LpDBuSHAXyMx9trxYaCY')
                                              .update({
                                            'investedAmt': FieldValue.increment(
                                                -data[index]['invested'])
                                          });
                                          firestore
                                              .collection('stocks')
                                              .doc('SxBhgUXBAIPpyzOoHBSO')
                                              .collection('portfolio')
                                              .doc(data[index]['stockName'])
                                              .delete();

                                          Navigator.of(context).pop();
                                        } catch (error) {
                                          print(error);
                                        }
                                      },
                                      child: const Text('SELL')),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('CANCEL'))
                                ],
                              );
                            });
                      },
                      child: PortfolioStockDetail(
                        data[index]['quantity'],
                        data[index]['price'],
                        data[index]['stockName'],
                      ),
                    );
                  });
            },
          ),
        ),
        const Divider(
          color: Colors.grey,
          // height: 16,
          // thickness: 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Day\'s P&L',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Row(
                children: const [
                  Text(
                    '-54.00',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '-0.51%',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 63),
      ],
    );
  }
}
