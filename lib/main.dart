import 'package:flutter/material.dart';

import 'views/views.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/about': (context) => AboutScreen(),
        '/profile': (context) => ProfileScreen(),
        '/topics': (context) => TopicsScreen(),
      },
      theme: ThemeData(
          brightness: Brightness.dark,
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.greenAccent),
          fontFamily: 'RobotoMono',
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 18),
            bodyText2: TextStyle(fontSize: 16),
            button: TextStyle(letterSpacing: 15, fontWeight: FontWeight.bold),
            headline1: TextStyle(fontWeight: FontWeight.bold),
            subtitle1: TextStyle(color: Colors.grey),
          )),
    );
  }
}
