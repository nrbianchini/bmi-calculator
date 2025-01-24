import 'package:flutter/material.dart';
import 'package:flutter_bmi/alert_message.dart';
import 'package:flutter_bmi/buttom_calculatebmi.dart';

import 'infobmi.dart';

class MyBMICalculator extends StatefulWidget {
  @override
  _MyBMICalculator createState() => _MyBMICalculator();
}

class _MyBMICalculator extends State<MyBMICalculator> {
  late TextEditingController weightController;
  late TextEditingController heightController;

  double? bmi;
  Color colorResult = Colors.grey; // Valor inicial para evitar erros

  @override
  void initState() {
    weightController = TextEditingController(text: '');
    heightController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bmi == null
                ? AlertMessage()
                : infoBMI(
                    colorResult: colorResult,
                    imc: bmi!,
                    getBMICategory: getBMICategory(bmi!),
                  ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('Your weight'),
                    const SizedBox(height: 6),
                    Container(
                      width: 75,
                      child: TextField(
                        controller: weightController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixText: 'kg',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 22),
                Column(
                  children: [
                    const Text('Your height'),
                    const SizedBox(height: 6),
                    Container(
                      width: 75,
                      child: TextField(
                        controller: heightController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixText: 'm',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            buttomcalculateBMI(
              onPressed: () {
                double? weight = double.tryParse(weightController.text);
                double? height = double.tryParse(heightController.text);

                if (weight != null && height != null && height > 0) {
                  setState(() {
                    bmi = weight / (height * height);
                    colorResult = _getColorBMI(bmi!);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter valid weight and height'),
                  ));
                }
                ;
              },
            ),
          ],
        ),
      ),
    );
  }

  String getBMICategory(double imc) {
    if (imc <= 15.5) {
      return 'Very Severely Underweight';
    } else if (imc <= 16.9) {
      return 'Severely Underweight';
    } else if (imc <= 18.4) {
      return 'Underweight';
    } else if (imc <= 24.9) {
      return 'Normal';
    } else if (imc <= 29.9) {
      return 'Overweight';
    } else if (imc <= 34.9) {
      return 'Obese Class I';
    } else if (imc <= 39.9) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  Color _getColorBMI(double imc) {
    if (imc <= 15.5) {
      return const Color.fromARGB(255, 151, 196, 232);
    } else if (imc <= 16.9) {
      return const Color.fromARGB(255, 131, 186, 232);
    } else if (imc <= 18.4) {
      return const Color.fromARGB(255, 86, 163, 225);
    } else if (imc <= 24.9) {
      return const Color.fromARGB(255, 52, 172, 56);
    } else if (imc <= 29.9) {
      return const Color.fromARGB(255, 232, 138, 131);
    } else if (imc <= 34.9) {
      return const Color.fromARGB(255, 241, 90, 79);
    } else if (imc <= 39.9) {
      return const Color.fromARGB(255, 244, 53, 39);
    } else {
      return const Color.fromARGB(255, 198, 35, 25);
    }
  }
}
