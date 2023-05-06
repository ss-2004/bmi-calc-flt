import 'package:flutter/material.dart';
import 'dart:math';

class Calculator extends StatelessWidget {
  Calculator({@required this.weight, @required this.height});

  final int weight;
  final double height;

  double _bmi=0;

  String getBMI() {
    _bmi = (weight / pow((height / 100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi > 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getFeedback() {
    if (_bmi >= 25)
      return "You have higher than normal bodyweight\nTry to exercise more";
    else if (_bmi > 18.5)
      return "You have a normal bodyweight\nGood Job!";
    else
      return "Youu have lower than normal bodyweight\nTry to eat more";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
