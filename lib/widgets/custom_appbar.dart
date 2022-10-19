import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final int index;
  const CustomAppBar(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
              'Marketwatch',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            IconButton(
              splashRadius: 17,
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.chevron_down,
                size: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      );
    }
    if (index == 2) {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Portfolio',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      );
    }
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
