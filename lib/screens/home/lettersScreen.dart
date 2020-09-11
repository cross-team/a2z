import 'package:flutter/material.dart';

class LettersScreen extends StatefulWidget {
  @override
  _LettersScreenState createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.popAndPushNamed(context, '/words');
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/add');
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
      currentIndex: 2,
      onTap: _onItemTapped,
    ));
  }
}
