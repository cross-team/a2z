import 'package:flutter/material.dart';
import 'package:a2z/screens/home/lettersScreen.dart';
import 'package:a2z/screens/home/wordsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  String getLetterColor(String letter, [bool light = false]) {
    Map letterColors = {
      'a': 'hsl(0, 100%, 42%)',
      'b': 'hsl(14, 100%, 42%)',
      'c': 'hsl(28, 100%, 42%)',
      'd': 'hsl(41, 100%, 42%)',
      'e': 'hsl(55, 100%, 42%)',
      'f': 'hsl(69, 100%, 42%)',
      'g': 'hsl(83, 100%, 42%)',
      'h': 'hsl(97, 100%, 42%)',
      'i': 'hsl(111, 100%, 42%)',
      'j': 'hsl(125, 100%, 42%)',
      'k': 'hsl(138, 100%, 42%)',
      'l': 'hsl(152, 100%, 42%)',
      'm': 'hsl(166, 100%, 42%)',
      'n': 'hsl(180, 100%, 42%)',
      'o': 'hsl(194, 100%, 42%)',
      'p': 'hsl(208, 100%, 42%)',
      'q': 'hsl(221, 100%, 42%)',
      'r': 'hsl(235, 100%, 42%)',
      's': 'hsl(249, 100%, 42%)',
      't': 'hsl(263, 100%, 42%)',
      'u': 'hsl(277, 100%, 42%)',
      'v': 'hsl(291, 100%, 42%)',
      'w': 'hsl(305, 100%, 42%)',
      'x': 'hsl(318, 100%, 42%)',
      'y': 'hsl(332, 100%, 42%)',
      'z': 'hsl(346, 100%, 42%)'
    };

    if (light) {
      String hslDark = letterColors[letter];
      String mid = hslDark.replaceAll(new RegExp(r'100%'), '73%');
      String hslLight = mid.replaceAll(new RegExp(r'42%'), '91%');

      return hslLight;
    }

    return letterColors[letter];
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
