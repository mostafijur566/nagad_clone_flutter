import 'package:flutter/material.dart';
import 'package:nagad_clone_flutter/pages/profile_body.dart';
import 'package:nagad_clone_flutter/pages/transaction_body.dart';

import 'contacts_body.dart';
import 'home_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  Color activeColor = Colors.deepOrange;
  Color inactiveColor = Colors.grey;

  static const List<Widget> _bottomMenu = [
    HomeBody(),
    TransactionBody(),
    ContactsBody(),
    ProfileBody()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bottomMenu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(const AssetImage("assets/ic_home_active.png"), color: _selectedIndex==0 ? activeColor : inactiveColor, size: 24,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(const AssetImage("assets/ic_transactions_active.png"), color: _selectedIndex==1 ? activeColor : inactiveColor, size: 24,),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(const AssetImage("assets/ic_people.png"), color: _selectedIndex==2 ? activeColor : inactiveColor, size: 24,),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(const AssetImage("assets/ic_my_nagad.png"), color: _selectedIndex==3 ? activeColor : inactiveColor, size: 24,),
            label: 'My Nagad',
          ),
        ],

        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: activeColor,
        showSelectedLabels: true,
        selectedIconTheme: const IconThemeData(color: Colors.deepOrange),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
