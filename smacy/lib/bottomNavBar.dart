import 'package:flutter/material.dart';
import 'package:smacy/Home.dart';
import 'package:smacy/main.dart';
import 'Search.dart';
import 'Home.dart';
import 'download.dart';

class navBar extends StatefulWidget {
  @override
  navBar_ createState() => navBar_();
}

class navBar_ extends State<navBar> {
  int currentindex = 0;
  final List<Widget> screens = [
    Center(child: download()),
    Center(child: SearchScreen()),
    Center(
      child: Text("Under Development phase",
          style: TextStyle(color: Colors.white, fontSize: 20)),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromRGBO(173, 225, 0, 1), width: 1.5),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 15,
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(Icons.download_for_offline_outlined),
              activeIcon: Icon(Icons.download_for_offline),
              label: "Download",
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentindex,
        children: screens,
      ),
    );
  }
}
