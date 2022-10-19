import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar(this.updateFn, {super.key});
  final void Function(int index) updateFn;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  Widget customNavItem(int index, String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.updateFn(index);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 2,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: selectedIndex == index ? Colors.black : Colors.white,
            ),
            Text(
              label,
              style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customNavItem(0, 'Watchlist', Icons.save_outlined),
          customNavItem(1, 'Orders', CupertinoIcons.list_bullet),
          customNavItem(2, 'Portfolio', Icons.circle_outlined),
          customNavItem(3, 'Wallet', Icons.shopping_bag_outlined),
          customNavItem(4, 'Account', Icons.person_outline),
        ],
      ),
    );
  }
}
