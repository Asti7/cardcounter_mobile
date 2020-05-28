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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xffea5e7b), Color(0xffec7065)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset('assets/${cardValue1}${cardType1}.png'),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset('assets/${cardValue2}${cardType2}.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {
                        setState(
                          () {
                            cardsRolled += 2;

                            cardValue1 = Values().cardValues[
                                Random().nextInt(Values().cardValues.length)];
                            cardType1 = Values().cardTypes[
                                Random().nextInt(Values().cardTypes.length)];

                            cardValue2 = Values().cardValues[
                                Random().nextInt(Values().cardValues.length)];
                            cardType2 = Values().cardTypes[
                                Random().nextInt(Values().cardTypes.length)];

                            if (Values()
                                .negativeOneValues
                                .contains(cardValue1)) {
                              count--;
                            }
                            if (Values()
                                .negativeOneValues
                                .contains(cardValue2)) {
                              count--;
                            }
                            if (Values()
                                .positiveOneValues
                                .contains(cardValue1)) {
                              count++;
                            }
                            if (Values()
                                .positiveOneValues
                                .contains(cardValue2)) {
                              count++;
                            }
                          },
                        );
                      },
                      color: Color(0xffbeebe9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text('Roll Card'),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {
                        setState(() {
                          showCount = count;
                        });
                      },
                      color: Color(0xffff78ae),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text('Show Count'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 6,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {
                        setState(
                          () {
                            count = 0;
                            showCount = 0;
                            cardsRolled = 0;

                            setState(() {
                              cardValue1 = "Start";
                              cardType1 = "start";

                              cardValue2 = "Start";
                              cardType2 = "start";
                            });
                          },
                        );
                      },
                      color: Color(0xffdcffcc),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Icon(Icons.refresh),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Count: ${showCount}',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white70,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    'Cards Rolled: ${cardsRolled}',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white70,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
