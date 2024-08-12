import 'package:bright_weddings/Component/new_profile.dart';
import 'package:bright_weddings/Component/sidebar.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/footer.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(40.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sidebar(),
              SizedBox(width: 5.w),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Profile',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                        ),
                      ),
                      SizedBox(height: 35),
                      NewProfile(),
                      SizedBox(height: 35),
                      Text(
                        'Success Rate',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 80.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4.0,
                                  ),
                                ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Success Rate',
                                  style: GoogleFonts.poppins(
                                    color: textColor,
                                    fontSize: 1.1.t,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.0.w,),
                          Container(
                            height: 30.0.h,
                            width: 40.0.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:30.h),
          Footer(),
        ],
      ),
    );
  }
}
