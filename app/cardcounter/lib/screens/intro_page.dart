import 'package:cardcounter/widgets/custom_popup.dart';
import 'package:cardcounter/widgets/showup.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroPage extends StatelessWidget {
  static const String id = 'intro_page';
  @override
  Widget build(BuildContext context) {
    var delayAmount = 500;
    return Scaffold(
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
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ShowUp(
                          delay: delayAmount * 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TypewriterAnimatedTextKit(
                                onTap: () {},
                                text: ['Hello'],
                                textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ShowUp(
                          delay: delayAmount * 2,
                          child: Text(
                            '👋',
                            style: TextStyle(
                                decoration: TextDecoration.none, fontSize: 30),
                          ),
                        ),
                        SizedBox(height: 25),
                        ShowUp(
                          delay: delayAmount * 3,
                          child: Text(
                            'This app will help you in practising card counting\n'
                            'and developing quick calculation skills for maintaining\n'
                            'the current count.\n\n'
                            'The method used for calculating count is based on the\n'
                            'Hi-Lo counting system.',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 26),
                          ),
                        ),
                        SizedBox(height: 20),
                        ShowUp(
                          delay: delayAmount * 4,
                          child: Text(
                            'For more info on Hi-Lo system, click on the i button 🙂',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                        ShowUp(
                          delay: delayAmount * 5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: RaisedButton(
                              onPressed: () {
                                // Navigator.push(context, FadeRoute(page: MainPage()));
                              },
                              color: Color(0xffff78ae),
                              elevation: 3,
                              child: Text('Play'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        ShowUp(
                          delay: delayAmount * 6,
                          child: Text(
                            '<> over 3 cups of ☕️ by Astitva',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ShowUp(
                  delay: delayAmount*7,
                  child: CustomPopUp(),
                )
              ],
            )
            // this is custom built widget button for pop up.
            ),
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
