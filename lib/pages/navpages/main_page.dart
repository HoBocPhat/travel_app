import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/navpages/bar_item_page.dart';
import 'package:flutter_cubit/pages/navpages/search_page.dart';

import '../home_page.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  void onTap(int index) {
    setState((){
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const BarItemPage(),
      const MyPage(),
      const SearchPage()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Chart",icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Person", icon: Icon(Icons.person))
        ],
      ),
    );
  }
}

