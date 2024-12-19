import 'package:bright_weddings/View/Login/login_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you are using GetX for navigation

class HoverButton extends StatefulWidget {
  @override
  _HoverButtonState createState() => _HoverButtonState();

  final String buttonText; // Text parameter to allow customization
  final double height; // Text parameter to allow customization
  final double width; // Text parameter to allow customization
  final VoidCallback onPressed;

  HoverButton({
    required this.buttonText,
    required this.height,
    required this.width,
    required this.onPressed,

  }); // Constructor to accept text
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed:  widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isHovered
                  ? Colors.white
                  : Color(0xFFE53E3E), // Change background to white on hover
              padding: EdgeInsets.symmetric(horizontal:  widget.width, vertical:  widget.height),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: _isHovered
                      ? Color(0xFFE53E3E)
                      : Colors.red, // Change border to red on hover
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: _isHovered
                    ? Color(0xFFE53E3E)
                    : Colors.white, // Change text color to red on hover
                fontSize: 20,
              ),
            ),
          ),

        ],
      ),
    );
  }

  void _setHover(bool hovered) {
    setState(() {
      _isHovered = hovered;
    });
  }
}
