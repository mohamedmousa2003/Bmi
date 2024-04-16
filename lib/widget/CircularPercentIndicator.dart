import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Circular extends StatelessWidget {
  String text;
  double valuepercent;
  double valueRadius;

  Circular(
      {required this.valuepercent,
      required this.text,
      required this.valueRadius});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircularPercentIndicator(
      radius: valueRadius,
      lineWidth: 20,
      percent: valuepercent,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animationDuration: 1000,
      center: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      progressColor: Colors.orange,
    );
  }
}
