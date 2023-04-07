import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const title = 'Shortcuts Demo';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 30),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const HomePage(title: title),
      );
}
