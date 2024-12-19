
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Success_Page_Mobile.dart';

class DashboardSuccessStoryMobile extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.h), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w), // Responsive border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column( // Using Column instead of Row for better mobile view
        crossAxisAlignment: CrossAxisAlignment.start, // Align to start
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.h), // Adjusted margin for mobile view
            child: Image.asset(
              'assets/images/couple.jpg',
              height: 35.h, // Keeping the height of image the same for mobile
              width: double.infinity, // Allowing the image to scale
              fit: BoxFit.cover, // Ensures the image doesn't get distorted
            ),
          ),
          SizedBox(height: 2.h), // Space between image and content
          Text(
            'John & Jane Smith',
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: 3.0.t, // Responsive font size
            ),
          ),
          SizedBox(height: 0.4.h),
          Text(
            'Wedding Date: 15th June 2021',
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: 1.5.t, // Responsive font size
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "John and Jane met on HappilyEverAfter and instantly clicked Their love story began with long conversations and weekend getaways They tied the knot in a beautiful ceremony surrounded by friends and family.",
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: 0.9.t, // Responsive font size
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 2.h), // Adjusted space between text and button
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => SuccessMobile());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 1.5.h, // Responsive button padding
                  horizontal: 5.w, // Responsive button padding
                ),
              ),
              child: Text(
                'View More',
                style: TextStyle(color: Colors.white, fontSize: 1.2.t), // Responsive font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
