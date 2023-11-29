import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget widget;
  final bool enableBorderSide;
  final void Function() onPressed;
  final double radiusValue;

  const CustomButton(
      {super.key,
      required this.widget,
      required this.onPressed,
      required this.radiusValue,
      required this.enableBorderSide});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusValue),
            side: enableBorderSide
                ? const BorderSide(width: 1.0, color: Colors.grey)
                : const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
      child: widget,
    );
  }
}
