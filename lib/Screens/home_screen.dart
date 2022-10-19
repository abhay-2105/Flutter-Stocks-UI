import 'package:flutter/material.dart';
import 'package:stock/Screens/portfolio.dart';
import 'package:stock/widgets/custom_appbar.dart';
import 'package:stock/Screens/watchlist.dart';
import '../widgets/custom_navigation_bar.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int currentIndex = 0;

  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const WatchListBody(),
      Container(),
      Portfolio(),
      Container(),
      Container()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: CustomAppBar(currentIndex)),
      body: Stack(
        children: [
          screens[currentIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomNavigationBar(updateIndex),
          )
        ],
      ),
    );
  }
}
