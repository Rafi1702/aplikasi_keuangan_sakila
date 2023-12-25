import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double? size;
  final String text;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String hintText;
  final double radiusValue;
  const CustomTextField({
    super.key,
    this.size,
    required this.text,
    this.suffix,
    this.keyboardType,
    required this.controller,
    required this.hintText,
    required this.radiusValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.blue[200] ?? Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xffE5E5E5),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.blue[200] ?? Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
