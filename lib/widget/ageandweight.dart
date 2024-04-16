import 'package:flutter/material.dart';

class AgeAndWeight extends StatelessWidget {
  String type;
  String result;
  void Function()? onPressedSum;
  void Function()? onPressedDiff;

  AgeAndWeight(
      {required this.type,
      required this.onPressedSum,
      required this.onPressedDiff,
      required this.result});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            type,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  iconSize: 35,
                  onPressed: onPressedSum,
                  icon: const Icon(Icons.add_circle),
                  color: Colors.orange),
              IconButton(
                iconSize: 35,
                onPressed: onPressedDiff,
                icon: const Icon(Icons.remove_circle),
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
