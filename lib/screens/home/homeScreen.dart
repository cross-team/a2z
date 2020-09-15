import 'package:flutter/material.dart';
import 'package:a2z/screens/home/lettersScreen.dart';
import 'package:a2z/screens/home/wordsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  Color getLetterColor(String letter, [bool light = false]) {
    Map letterHues = {
      'a': 0.0,
      'b': 13.846,
      'c': 27.692,
      'd': 41.538,
      'e': 55.384,
      'f': 69.23,
      'g': 83.076,
      'h': 96.922,
      'i': 110.768,
      'j': 124.614,
      'k': 138.46,
      'l': 152.306,
      'm': 166.152,
      'n': 179.998,
      'o': 193.844,
      'p': 207.69,
      'q': 221.536,
      'r': 235.382,
      's': 249.228,
      't': 263.074,
      'u': 276.92,
      'v': 290.766,
      'w': 304.612,
      'x': 318.458,
      'y': 332.304,
      'z': 346.15,
    };

    if (light) {
      return HSLColor.fromAHSL(1.0, letterHues[letter], 0.73, 0.91).toColor();
    }

    return HSLColor.fromAHSL(1.0, letterHues[letter], 1.0, 0.42).toColor();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic screen;
    switch (_selectedIndex) {
      case 0:
        screen = WordsScreen(
          getColor: getLetterColor,
        );
        break;
      case 2:
        screen = LettersScreen(
          getColor: getLetterColor,
        );
        break;
      default:
        screen = Text('');
        break;
    }

    return Scaffold(
        body: Center(child: screen),
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
              icon: Icon(Icons.border_all),
              title: Text('Letters'),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 30,
        ));
  }
}
