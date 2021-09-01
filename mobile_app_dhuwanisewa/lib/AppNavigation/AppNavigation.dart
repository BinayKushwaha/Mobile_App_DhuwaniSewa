import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/AppSetting/Widget/SettingNavigation.dart';

class AppNavigation extends StatefulWidget {
  AppNavigationState createState() {
    return AppNavigationState();
  }
}

class AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;
  static const TextStyle buttionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOption = <Widget>[
    Text('Index 0: Home', style: buttionStyle),
    Text('Index 1: My Task', style: buttionStyle),
    Text('Index 2: History', style: buttionStyle),
    SettingNavigationPage()
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
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'My Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'More',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red[500],
        unselectedItemColor: Colors.grey[600],
      ),
    );
  }
}
