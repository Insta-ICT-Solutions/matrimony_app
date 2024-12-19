import 'package:bright_weddings/Component/Dashboard/rating_dots.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Helper/colors.dart';

class SuccessRateView extends StatelessWidget {
  SuccessRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5.h),
      width: 80.w,
      height: 23.h,
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
          SizedBox(height: 1.5.h),  // Adjusted the height to avoid overflow
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2.h),
                height: 14.h,  // Adjusted the height to avoid overflow
                width: 30.w,
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
                        fontSize: 2.8.t,  // Adjusted the font size to fit
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),  // Adjusted width to prevent overflow
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,  // Adjusted the height to avoid overflow
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Male",
                              style: GoogleFonts.playfairDisplay(
                                color: redcolor,
                                fontSize: 1.0.t,
                              ),),
                            SizedBox(
                              height: 0.5.h,  // Adjusted the height to avoid overflow
                            ),
                            RatingDots(
                              color: Colors.red,
                              text: '12 ',
                              avatarImage: 'assets/images/man.png', // Provide the correct image path here
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Female",
                              style: GoogleFonts.playfairDisplay(
                                color: redcolor,
                                fontSize: 1.0.t,
                              ),),
                            SizedBox(
                              height: 0.5.h,  // Adjusted the height to avoid overflow
                            ),
                            RatingDots(
                              color: Colors.red,
                              text: '12 ',
                              avatarImage: 'assets/images/woman.png', // Provide the correct image path here
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 1.0.h),
                    Divider(height: 20,),
                    SizedBox(height: 1.0.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Second Male",
                              style: GoogleFonts.playfairDisplay(
                                color: redcolor,
                                fontSize: 1.0.t,
                              ),),
                            SizedBox(
                              height: 0.5.h,  // Adjusted the height to avoid overflow
                            ),
                            RatingDots(
                              color: Colors.red,
                              text: '122',
                              avatarImage: 'assets/images/man.png', // Provide the correct image path here
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Second Female",
                              style: GoogleFonts.playfairDisplay(
                                color: redcolor,
                                fontSize: 1.0.t,
                              ),),
                            SizedBox(
                              height: 0.5.h,  // Adjusted the height to avoid overflow
                            ),
                            RatingDots(
                              color: Colors.red,
                              text: '12 ',
                              avatarImage: 'assets/images/woman.png', // Provide the correct image path here
                            ),
                          ],
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
}
