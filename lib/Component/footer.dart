import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = (screenWidth * 0.02).clamp(16.0, 24.0);
    final padding = (screenWidth * 0.05).clamp(20.0, 40.0);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            color: footerColor,
          ),
        ),
        Positioned(
          top: -2.5.h,
          child: Container(
            height: 5.0.h.clamp(50.0, 80.0),
            padding: EdgeInsets.symmetric(horizontal: padding),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: footerTitleColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Text(
              "Free Support: +91 1234567890    |    Email: it.team.instaict@gmail.com",
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
