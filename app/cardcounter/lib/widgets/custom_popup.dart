import 'package:flutter/material.dart';

import 'custom_dialog.dart';

class CustomPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.8, -0.9),
      child: IconButton(
        iconSize: 30,
        icon: Icon(Icons.info),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(),
          );
        },
        color: Color(0xffdcffcc),
      ),
    );
  }
}
