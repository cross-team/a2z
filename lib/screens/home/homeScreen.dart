import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text((() {
          switch (_selectedIndex) {
            case 0:
              return 'Words List';
              break;
            case 1:
              return 'Add a Word';
              break;
            case 2:
              return 'Letters List';
              break;
            default:
              return '';
              break;
          }
        }()))),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('Words'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              title: Text('Add Word'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text('Letters'),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 44,
        ));
  }
}
