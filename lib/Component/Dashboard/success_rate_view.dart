import 'package:bright_weddings/Component/Dashboard/rating_dots.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helper/colors.dart';

class SuccessRateView extends StatelessWidget {

  SuccessRateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 80.w,
      height: 23.h, // Increased height to accommodate all elements
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
          Row(
            children: [
              Text(
                "Success Rate",
                style: GoogleFonts.playfairDisplay(
                  color: textColor,
                  fontSize: 1.5.t,
                ),
              ),
              Spacer(),
              Container(
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Icon(Icons.more_vert, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2.h),
                height: 15.h,
                width: 15.h,
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
                      gradient: LinearGradient(colors: [
                        Color(0xFF351FE2),
                        Color(0xFFD1088E),
                      ]),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "90%",
                      style: TextStyle(
                        fontSize: 3.t,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Column(
                children: [
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      RatingDots(
                        color: ratingDot1,
                        text: "12 Likes",
                      ),
                      SizedBox(width: 5.w),
                      RatingDots(
                        color: ratingDot2,
                        text: "12 Likes",
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      RatingDots(
                        color: ratingDot3,
                        text: "12 Likes",
                      ),
                      SizedBox(width: 5.w),
                      RatingDots(
                        color: ratingDot4,
                        text: "12 Likes",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
