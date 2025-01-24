import 'package:flutter/material.dart';

class infoBMI extends StatelessWidget {
  infoBMI({
    required this.colorResult,
    required this.imc,
    required this.getBMICategory,
  });

  final Color colorResult;
  final double imc;
  final String getBMICategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        border: Border.all(
          width: 10,
          color: colorResult,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            imc.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 42,
              color: colorResult,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            getBMICategory,
            style: TextStyle(
              fontSize: 20,
              color: colorResult,
            ),
          ),
        ],
      ),
    );
  }
}
