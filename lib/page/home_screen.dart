import 'dart:math';

import 'package:bmi/page/resultScreen.dart';
import 'package:bmi/widget/ageandweight.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widget/select_MF.dart';

class HomeScreen extends StatefulWidget {
  static String routName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClick = true;
  var sliderValue = 30.0;
  var clickAge = 1;
  var clickWeight = 1;
  var valueClickAge = 10;
  var valueClickWeight = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Select(
                  dataIcon: Icons.male,
                  type: "MALE",
                  color1: isClick ? Colors.orange : Colors.white,
                  onDataReceived: () {
                    setState(() {
                      isClick = true;
                    });
                  }),
              Select(
                  dataIcon: Icons.female,
                  type: "FEMALE",
                  color1: isClick ? Colors.white : Colors.orange,
                  onDataReceived: () {
                    isClick = false;
                    setState(() {});
                  }),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${sliderValue.round()}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: SfSlider.vertical(
                          min: 0.0,
                          max: 199.0,
                          value: sliderValue,
                          interval: 30,
                          showTicks: true,
                          showLabels: true,
                          activeColor: Colors.orange,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            setState(() {
                              sliderValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    AgeAndWeight(
                        type: "Age",
                        onClickSum: () {
                          valueClickAge += clickAge;
                          setState(() {});
                        },
                        onClickREmove: () {
                          valueClickAge -= clickAge;
                          setState(() {});
                        },
                        result: "$valueClickAge"),
                    AgeAndWeight(
                        type: "Weight",
                        onClickSum: () {
                          valueClickWeight += clickWeight;
                          setState(() {});
                        },
                        onClickREmove: () {
                          valueClickWeight -= clickWeight;
                          setState(() {});
                        },
                        result: "$valueClickWeight"),
                  ],
                ),
              ),
            ],
          ),
          MaterialButton(
            color: Colors.orange,
            onPressed: () {
              var result = valueClickWeight / pow(sliderValue / 100, 2);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      age: valueClickAge,
                      height: sliderValue.toInt(),
                      result: result,
                    ),
                  ));
            },
            child: const Text(
              "Calculate",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
