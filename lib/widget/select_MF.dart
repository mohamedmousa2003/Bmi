import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  String type;
  IconData dataIcon;
  Function onDataReceived;
  Color? color1;

  Select(
      {required this.dataIcon,
      required this.type,
      this.color1,
      required this.onDataReceived});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onDataReceived();
        },
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 180,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Icon(
                dataIcon,
                size: 60,
              ),
              Text(
                type,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
