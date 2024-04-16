import 'package:flutter/material.dart';

class Click extends StatelessWidget {
  Function ClickButton;
  IconData dataIcon;

  Click({required this.ClickButton, required this.dataIcon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        color: Colors.orange,
        iconSize: 30,
        onPressed: () {
          ClickButton();
        },
        icon: Icon(dataIcon));
  }
}
