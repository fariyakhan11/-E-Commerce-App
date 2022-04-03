import 'package:book_app/Screens/search.dart';
import 'package:book_app/Screens/user_info.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'cart.dart';
import 'home.dart';
import 'app_bar.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List pages = [Home(),DropdownScreen(), Search(), Cart(), UserInfo()];
  int _selectedPageIndex = 0;
  @override
  void initState() {
    pages = [
      {'page': Home(), 'title': 'Home Screen'},
      {'page': DropdownScreen(), 'title': 'Category'},
      {'page': Search(), 'title': 'Search Screen'},
      {'page': Cart(), 'title': 'Cart Screen'},
      {'page': UserInfo(), 'title': 'User Screen'},
    
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true,
      // title: Text(pages[_selectedPageIndex]['title']),),
      body: pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 1.1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.teal,
              selectedItemColor: Colors.deepPurple,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  tooltip: 'Home',
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Category',
                  tooltip: 'Category',
                ),
                BottomNavigationBarItem(
                    activeIcon: null, icon: Icon(null), label: 'Search'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: 'Cart',
                  tooltip: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'User',
                  tooltip: 'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          backgroundColor: Colors.teal,
          elevation: 4,
          child: Icon(Icons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
