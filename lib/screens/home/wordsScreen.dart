import 'package:flutter/material.dart';

class WordsScreen extends StatefulWidget {
  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        Navigator.popAndPushNamed(context, '/add');
        break;
      case 2:
        Navigator.popAndPushNamed(context, '/');
        break;
      default:
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
      currentIndex: 0,
      onTap: _onItemTapped,
    ));
  }
}
