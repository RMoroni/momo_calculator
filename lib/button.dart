import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  static double height = 72.0;
  static double margin = 8.0;

  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onTap;
  final bool doubleWidth;
  final bool active;

  const CalculatorButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.onTap,
    this.doubleWidth = false,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: active ? textColor : color,
          shape: doubleWidth ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: doubleWidth ? const BorderRadius.all(Radius.circular(32)) : null,
        ),
        height: height,
        width: doubleWidth ? height * 2 + margin * 2 : height,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: active ? color : textColor,
            ),
          ),
        ),
      ),
    );
  }
}
