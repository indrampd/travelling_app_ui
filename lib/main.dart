import 'package:flutter/material.dart';
import 'package:travelling_app/boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelling App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.blueAccent,
              secondary: const Color.fromRGBO(244, 250, 254, 1),
            ),
      ),
      home: const BoardingScreen(),
    );
  }
}
