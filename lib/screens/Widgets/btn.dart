import 'package:flutter/material.dart';

class btn extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final double? widthc;

  const btn({
    super.key,
    required this.label,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
    this.widthc,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.25),
        // iconSize: widthc,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
