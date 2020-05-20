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
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xffea5e7b), Color(0xffec7065)]),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child:
                            Image.asset('assets/${cardValue1}${cardType1}.png'),
                      ),
                      Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child:
                            Image.asset('assets/${cardValue2}${cardType2}.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                  Wrap(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          elevation: 3,
                          onPressed: () {
                            setState(
                              () {
                                cardsRolled += 2;

                                cardValue1 = Values().cardValues[Random()
                                    .nextInt(Values().cardValues.length)];
                                cardType1 = Values().cardTypes[Random()
                                    .nextInt(Values().cardTypes.length)];

                                cardValue2 = Values().cardValues[Random()
                                    .nextInt(Values().cardValues.length)];
                                cardType2 = Values().cardTypes[Random()
                                    .nextInt(Values().cardTypes.length)];

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
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        width: 150,
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
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        child: Tooltip(
                          message: "Refresh count and start over !",
                          margin: EdgeInsets.all(10),
                          height: 100,
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
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Count: ${showCount}',
              style: TextStyle(
                fontSize: 46,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Cards Rolled: ${cardsRolled}',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: FlatButton(
              child: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),

        // this is custom built widget button for pop up.

        CustomPopUp()
      ],
    );
  }
}
