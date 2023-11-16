import 'dart:math';

import 'package:bmi/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  double height;
  double weight;
  bool isMale;

  ResultPage(
      {super.key,
      required this.height,
      required this.weight,
      required this.isMale});

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result = '';
    switch (bmiCalc) {
      case < 16:
        result = "Severe Thinness";
        break;
      case > 18.5 && < 25:
        result = "Normal";
        break;
      case > 25 && < 30:
        result = "Overweight";
        break;
      case > 30:
        result = "Obese";
        break;
      default:
    }
    return Scaffold(
      backgroundColor: isMale? kBlueColor : kRedColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI IS :",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                bmiCalc.toStringAsFixed(1),
                style: TextStyle(color: Colors.white, fontSize: 46),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              SizedBox(
                height: 30,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
