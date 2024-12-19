import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/Helper/colors.dart';

class RatingDots extends StatelessWidget {
  final Color color;
  final String text;
  final String avatarImage; // New field for avatar image
  final double fontSize; // Make fontSize optional

  // Constructor with a default value for fontSize
  RatingDots({
    required this.color,
    required this.text,
    required this.avatarImage,
    this.fontSize = 1.0,  // Default fontSize is 1.0.t (responsive size or custom size)
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Display avatar image as circular avatar
        CircleAvatar(
          backgroundImage: AssetImage(avatarImage), // Avatar image from asset
          radius: 3.w, // You can adjust the radius
        ),
        SizedBox(width: 1.w), // Space between avatar and circle dot
        // CircleAvatar(
        //   backgroundColor: color,
        //   radius: 3.w,
        // ),
        SizedBox(width: 1.w),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize.t, // Using the fontSize (converted to responsive size)
          ),
        ),
      ],
    );
  }
}

