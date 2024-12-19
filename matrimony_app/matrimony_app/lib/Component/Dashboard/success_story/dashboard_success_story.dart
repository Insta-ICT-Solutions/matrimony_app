import 'package:bright_weddings/Component/Dashboard/success_story/Add_Success_story.dart';
import 'package:bright_weddings/Component/Dashboard/success_story/success_story.dart';
import 'package:bright_weddings/Component/switch_list_tile.dart';
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardSuccessStory extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns items within the Row to the top
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/couple.jpg',
                  height: 250,
                  width: 300,
                ),
              ),
            ],
          ),
          // SizedBox(width: 10),
          Container(
            width: 1, // Width of the vertical line
            height: 300, // Height of the vertical line
            color: Colors.grey, // Color of the vertical line
          ),
          SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Expanded(
              // This forces the column to take available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Ensures left alignment inside the column
                children: [
                  Text(
                    'John & Jane Smith',
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 2.0.t,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  // Add more widgets as needed
                  Text(
                    'Wedding Date: 15th June 2021',
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 0.8.t,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'John and Jane met on HappilyEverAfter and instantly clicked. \n'
                    'Their love story began with long conversations and weekend getaways.\n'
                    'They tied the knot in a beautiful ceremony surrounded by friends and family.',
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 0.9.t,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 2.h),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => SuccessStory());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View More',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
