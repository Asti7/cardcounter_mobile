import 'package:cardcounter/widgets/custom_popup.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../value.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var cardValue1 =
      Values().cardValues[Random().nextInt(Values().cardValues.length)];
  var cardType1 =
      Values().cardTypes[Random().nextInt(Values().cardTypes.length)];

  var cardValue2 =
      Values().cardValues[Random().nextInt(Values().cardValues.length)];
  var cardType2 =
      Values().cardTypes[Random().nextInt(Values().cardTypes.length)];

  var count = 0;
  var showCount = 0;
  var cardsRolled = 0;

  @override
  void initState() {
    super.initState();
    cardValue1 = "Start";
    cardType1 = "start";

    cardValue2 = "Start";
    cardType2 = "start";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Card Counter'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xffea5e7b), Color(0xffec7065)],
            ),
          ),
        ),
      ),
    );
  }
}
