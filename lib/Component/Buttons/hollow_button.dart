import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HollowButton extends StatelessWidget {
  final String title;
  final double height;
  final double? width;
  final VoidCallback onTap;
  HollowButton({super.key, required this.title, required this.onTap, required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width != null ? width : double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: darkBorderColor,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(title,overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(
          fontSize: 1.3.t,
          color: darkBorderColor,
        ),),
      ),
    );
  }
}
