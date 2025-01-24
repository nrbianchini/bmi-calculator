import 'package:flutter/material.dart';

class buttomcalculateBMI extends StatelessWidget {
  buttomcalculateBMI({
    required this.onPressed,
  });
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: const Text(
          'Calculate',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 122, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
