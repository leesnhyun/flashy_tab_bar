import 'package:flutter/material.dart';

import 'package:flashy_tab_bar/flashy_tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('FlashyTabBar (Flutter Version)'),
        ),
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.event),
              title: Text('Events'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.highlight),
              title: Text('Highlights'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.settings),
              title: Text('한국어'),
            ),
          ],
        ),
      ),
    );
  }
}
