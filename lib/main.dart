import 'package:a2z/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:a2z/screens/addWord/addWordScreen.dart';
import 'package:a2z/screens/home/homeScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> primary = {
      50: Color.fromRGBO(0, 214, 66, .1),
      100: Color.fromRGBO(0, 214, 66, .2),
      200: Color.fromRGBO(0, 214, 66, .3),
      300: Color.fromRGBO(0, 214, 66, .4),
      400: Color.fromRGBO(0, 214, 66, .5),
      500: Color.fromRGBO(0, 214, 66, .6),
      600: Color.fromRGBO(0, 214, 66, .7),
      700: Color.fromRGBO(0, 214, 66, .8),
      800: Color.fromRGBO(0, 214, 66, .9),
      900: Color.fromRGBO(0, 214, 66, 1),
    };

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(0xFF000000, primary),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFF333333))),
      ),
      routes: {
        '/': (context) =>
            BlocProvider(create: (_) => HomeBloc(), child: HomeScreen()),
        '/add': (context) => AddWordScreen(),
      },
    );
  }
}
