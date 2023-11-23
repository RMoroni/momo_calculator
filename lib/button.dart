import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onTap;

  const CalculatorButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        height: 56,
        width: 56,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}