import 'package:flutter/material.dart';
import 'package:invest_guide/home/drawer/drawer.dart';
import 'package:invest_guide/home/news/news.dart';
import 'package:invest_guide/home/quotation/quotation.dart';

class HomeScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    NewsScreen(
        key: PageStorageKey(
      'News',
    )),
    QuotationScreen(
      key: PageStorageKey('Quotation'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _currentIndex = 0;

  Widget _bottomNavigationBar(int currentIndex) => BottomNavigationBar(
          selectedItemColor: Colors.blue[600],
          unselectedItemColor: Colors.black,
          onTap: (int index) => setState(() => _currentIndex = index),
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard), label: 'Quotation'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.textsms,
                ),
                label: 'News'),
          ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: _bottomNavigationBar(_currentIndex),
      body: PageStorage(
        child: pages[_currentIndex],
        bucket: bucket,
      ),
    );
  }
}
