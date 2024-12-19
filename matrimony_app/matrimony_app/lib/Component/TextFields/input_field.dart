import 'package:bright_weddings/Helper/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Widget? suffixIcon;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double? width; // Nullable width
  final double? height; // Nullable height
  final TextStyle? labelTextStyle; // Optional label text style

  const InputField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    this.suffixIcon,
    this.width,
    this.height,
    this.labelTextStyle, // Optional style parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use null if not provided
      height: height, // Use null if not provided
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: labelTextStyle, // Apply the optional style
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: borderColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
