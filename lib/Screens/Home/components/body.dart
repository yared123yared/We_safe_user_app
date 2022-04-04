import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wesafeapp/Screens/Home/components/History Page.dart';
import 'package:wesafeapp/Screens/Home/components/Live Page.dart';
import 'package:wesafeapp/Screens/Home/components/News%20Page.dart';
import 'package:wesafeapp/Screens/Home/components/Report%20Page.dart';
import 'package:wesafeapp/Screens/Login/components/body.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  PageController controller = PageController();
  static List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    LivePage(),
    ReportPage(),
    HistoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined, color: Colors.grey,),
            label: 'News',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv, color: Colors.grey,),
            label: 'Live',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag, color: Colors.grey,),
            label: 'Report',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.grey,),
            label: 'History',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
