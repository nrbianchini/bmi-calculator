import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Input values of weight and height to calculate your BMI',
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}
