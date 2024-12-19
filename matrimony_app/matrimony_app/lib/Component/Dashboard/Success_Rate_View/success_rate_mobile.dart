import 'package:bright_weddings/Component/Dashboard/rating_dots.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Helper/colors.dart';

class SuccessRateViewMobile extends StatelessWidget {
  SuccessRateViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width; // For responsive width
    final double height = MediaQuery.of(context).size.height; // For responsive height

    return Container(
      padding: EdgeInsets.all(1.5.h),
      width: width * 0.9, // 90% of the screen width
      height: height * 0.35, // 28% of the screen height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Text(
                "Success Rate",
                style: GoogleFonts.playfairDisplay(
                  color: textColor,
                  fontSize: width * 0.045, // Adjust font size based on width
                ),
              ),
              Spacer(),
              Container(
                width: width * 0.1, // Adjust icon size based on width
                height: width * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Icon(Icons.more_vert, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: height * 0.015), // Adjust spacing dynamically

          // Success Circle and Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Success Percentage Circle
              Container(
                padding: EdgeInsets.all(height * 0.02),
                height: height * 0.16, // Adjust size for responsiveness
                width: width * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF351FE2), Color(0xFFD1088E)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "90%",
                      style: TextStyle(
                        fontSize: width * 0.07, // Adjust font size dynamically
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.05), // Adjust spacing dynamically

              // Male and Female Data
              Expanded(
                child: Column(
                  children: [
                    // First Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildGenderInfo(
                          "Male",
                          "12",
                          "assets/images/man.png",
                          width,
                          redcolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: _buildGenderInfo(
                            "Female",
                            "12",
                            "assets/images/woman.png",
                            width,
                            redcolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01), // Adjust spacing dynamically
                    Divider(height: 1, color: Colors.grey.shade300),
                    SizedBox(height: height * 0.01),

                    // Second Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGenderInfo(
                          "Second Male",
                          "122",
                          "assets/images/man.png",
                          width,
                          redcolor,
                        ),
                        _buildGenderInfo(
                          "Second Female",
                          "12",
                          "assets/images/woman.png",
                          width,
                          redcolor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for Gender Info
  Widget _buildGenderInfo(String title, String count, String avatarImage,
      double width, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            color: textColor,
            fontSize: width * 0.035, // Adjust font size based on width
          ),
        ),
        SizedBox(height: width * 0.01),
        RatingDots(
          color: Colors.red,
          text: count,
          fontSize:2,
          avatarImage: avatarImage,
        ),
      ],
    );
  }
}
