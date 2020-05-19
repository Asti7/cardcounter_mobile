import 'package:cardcounter/screens/intro_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(CardCounter());

class CardCounter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
      },
    );
  }
}
