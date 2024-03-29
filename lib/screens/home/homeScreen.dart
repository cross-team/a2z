import 'package:flutter/material.dart';
import 'package:a2z/bloc/home_bloc.dart';
import 'package:a2z/screens/home/lettersScreen.dart';
import 'package:a2z/screens/home/wordsScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  Color getLetterColor(String letter, [bool dark = false]) {
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

    if (dark) {
      return HSLColor.fromAHSL(1.0, letterHues[letter.toLowerCase()], 0.73, 0.3)
          .toColor();
    }

    return HSLColor.fromAHSL(1.0, letterHues[letter.toLowerCase()], 1.0, 0.325)
        .toColor();
  }

  _launchURL() async {
    const url = 'https://criticalalphabet.com/suggest/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      void _onItemTapped(int index) {
        final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
        switch (index) {
          case 0:
            homeBloc.add(SetView('words', 'all', ''));
            break;
          case 1:
            _launchURL();
            break;
          case 2:
            homeBloc.add(SetView('letters'));
            break;
          default:
        }
      }

      if (state is HomeWords) {
        return Scaffold(
          body: Center(
            child: WordsScreen(
              getColor: getLetterColor,
              letter: state.letter,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                title: Text('Words'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                title: Text('Suggest a Word'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dialpad),
                title: Text('Letters'),
              ),
            ],
            currentIndex: 0,
            onTap: _onItemTapped,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        );
      }
      if (state is HomeLetters) {
        return Scaffold(
          body: Center(
            child: LettersScreen(
              getColor: getLetterColor,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                title: Text('Words'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                title: Text('Suggest a Word'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dialpad),
                title: Text('Letters'),
              ),
            ],
            currentIndex: 2,
            onTap: _onItemTapped,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        );
      }
      return Scaffold(
        body: Center(
          child: Text('Error!!!'),
        ),
      );
    });
  }
}
