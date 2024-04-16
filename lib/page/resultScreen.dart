import 'package:flutter/material.dart';

import '../widget/CircularPercentIndicator.dart';

class ResultScreen extends StatelessWidget {
  int age;
  int height;
  double result;

  ResultScreen({required this.age, required this.result, required this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Circular(
                  text: "Age",
                  valueRadius: 80,
                  valuepercent: age / 100,
                ),
              ),
              Expanded(
                child: Circular(
                  text: "Height",
                  valueRadius: 80,
                  valuepercent: height / 250,
                ),
              ),
            ],
          ),
          Expanded(
            child: Circular(
              text: "BMI ",
              valuepercent: 0.8,
              valueRadius: 100,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadiusDirectional.circular(8)),
              child: Text(
                "${resultBmi()}",
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? resultBmi() {
    if (result < 18.5) {
      return "weight loss\n Amount: ${18.5 - result.round()}";
    } else if (result >= 18.5 && result <= 25) {
      return "Healthy weight ";
    } else if (result > 25 && result <= 29.9) {
      return "Over weight\n Amount: ${result.round() - 24}";
    } else {
      return "Excess obesity weight";
    }
  }
}
