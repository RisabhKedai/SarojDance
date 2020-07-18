import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saroj Dance',
      theme: ThemeData(
        primarySwatch: deepPurp,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}

const MaterialColor deepPurp = const MaterialColor(
  0xff311b92,
  const <int, Color>{
    50: const Color(0xff311b92),
    100: const Color(0xff311b92),
    200: const Color(0xff311b92),
    300: const Color(0xff311b92),
    400: const Color(0xff311b92),
    500: const Color(0xff311b92),
    600: const Color(0xff311b92),
    700: const Color(0xff311b92),
    800: const Color(0xff311b92),
    900: const Color(0xff311b92),
  },
);
