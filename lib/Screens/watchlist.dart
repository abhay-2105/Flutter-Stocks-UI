import 'package:flutter/material.dart';
import 'package:stock/widgets/stock_list.dart';

class WatchListBody extends StatelessWidget {
  const WatchListBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: Colors.grey.shade400,
        ),
        Column(
          children: [
            Container(
              color: Colors.white,
              height: 60,
            ),
            const StockList()
          ],
        ),
        SizedBox(
          height: 30,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                color: Colors.black,
                child: const Text(
                  'Banks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              const Text(
                'Watchlist 2',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(width: 25),
              const Text(
                'Nike',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(width: 25),
              const Text(
                'Tata',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(width: 25),
              const Text(
                'MW7',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(width: 25),
              const Text(
                'others',
                style: TextStyle(color: Colors.black, fontSize: 15),
              )
            ],
          ),
        ),
        Positioned(
          top: 45,
          child: Material(
            borderRadius: BorderRadius.circular(5),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 30,
              width: MediaQuery.of(context).size.width - 20,
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: 7),
                            child: Text(
                              '12/50',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          contentPadding: EdgeInsets.only(bottom: 17),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Search & add',
                          hintStyle: TextStyle(fontSize: 14)),
                    ),
                  ),
                  VerticalDivider(
                    endIndent: 5,
                    indent: 5,
                  ),
                  Icon(
                    Icons.menu,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
