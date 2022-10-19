import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockList extends StatefulWidget {
  const StockList({super.key});

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  late final TextEditingController textEditingController;
  bool isEnable = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  Widget stockDetail(String stockName, double price, int increment,
      double percentage, BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(stockName,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    Text(
                      'Rs. ${price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                ),
                content: Row(
                  children: [
                    const Expanded(child: Text('Enter quantity')),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        autofocus: true,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        cursorHeight: 22,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    )
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        if (textEditingController.text != '') {
                          try {
                            firestore
                                .collection('stocks')
                                .doc('SxBhgUXBAIPpyzOoHBSO')
                                .collection('portfolio')
                                .doc(stockName)
                                .set(
                              {
                                'stockName': stockName,
                                'price': price,
                                'quantity': FieldValue.increment(
                                    int.parse(textEditingController.text)),
                                'invested': FieldValue.increment(price *
                                    int.parse(textEditingController.text))
                              },
                            );
                            firestore
                                .collection('stocks')
                                .doc('LpDBuSHAXyMx9trxYaCY')
                                .update({
                              'investedAmt': FieldValue.increment((price *
                                  int.parse(textEditingController.text)))
                            });
                            textEditingController.text = '';
                            Navigator.of(context).pop();
                          } catch (error) {
                            print(error);
                          }
                        }
                      },
                      child: const Text('BUY')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        textEditingController.text = '';
                      },
                      child: const Text('CANCEL'))
                ],
              );
            });
      },
      child: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stockName,
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade300),
                ),
                Text(
                  'NSE',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade300),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      price.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 16,
                          color: price == 1362.05
                              ? Colors.greenAccent
                              : Colors.red),
                    ),
                    Row(
                      children: [
                        Text(
                          '↑ $increment%',
                          style: const TextStyle(
                              fontSize: 11, color: Colors.greenAccent),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '($percentage%)',
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const Icon(
                  CupertinoIcons.arrow_up,
                  color: Colors.greenAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      height: MediaQuery.of(context).size.height * 0.62,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        children: [
          stockDetail('SBIN', 479.10, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('SBICARD', 835.30, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('HDFCBANK', 1362.05, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('PNB', 30.30, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('BANKBARODA', 104.05, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('BANKINDIA', 36.50, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('ICICIBANK', 45.60, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('SBICARD', 835.30, 2, 0.25, context),
          const Divider(
            height: 25,
            thickness: 0.4,
            color: Colors.grey,
          ),
          stockDetail('HDFCBANK', 1362.05, 2, 0.25, context),
        ],
      ),
    );
  }
}
