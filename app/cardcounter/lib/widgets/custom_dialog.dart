import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Color(0xffdcffcc),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text(
                'Info',
                style: TextStyle(fontSize: 30, color: Colors.black,),
              ),
              SizedBox(height: 20),
              Text(
                'Hi-Lo is a counting startegy according\n'
                'to which the cards are assigned an\n'
                'integer value of -1,0 or +1.\n\n'
                'Cards: 10s Aces Kings Queens Jacks => -1\n\n'
                'Cards: 7s 8s 9s => 0\n\n'
                'Cards: 2s 3s 4s 5s 6s => +1\n\n'
                'The count is a total of these values at the end.\n\n'
                'Click multiple times on the Roll Cards button\n'
                'to draw new cards and when ready tally your count\n'
                'with the show count button.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
