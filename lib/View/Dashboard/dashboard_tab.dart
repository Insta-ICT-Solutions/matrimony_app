import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/new_profile.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list.dart';
import 'package:bright_weddings/Component/Dashboard/profile_status.dart';
import 'package:bright_weddings/Component/Dashboard/recent_success.dart';
import 'package:bright_weddings/Component/Dashboard/sidebar.dart';
import 'package:bright_weddings/Component/Dashboard/success_graph.dart';
import 'package:bright_weddings/Component/Dashboard/success_rate_view.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/Dashboard/profile_completion_status.dart';
import '../../Component/footer.dart';
import '../../Mock API/user_list.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: Header(),
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
                      Row(
                        children: [
                          Text(
                            'Success Rate',
                            style: GoogleFonts.playfairDisplay(
                              color: textColor,
                              fontSize: 1.5.t,
                            ),
                          ),
                          SizedBox(
                            width: 66.w,
                          ),
                          Text(
                            'Recent Success',
                            style: GoogleFonts.playfairDisplay(
                              color: textColor,
                              fontSize: 1.5.t,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SuccessRateView(),
                              SizedBox(
                                height: 1.h,
                              ),
                              SuccessGraph()
                            ],
                          ),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          RecentSuccess(userList: userList)
                        ],
                      ),
                      SizedBox(height: 35),
                      Text(
                        'Profile List',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                        ),
                      ),
                      SizedBox(height: 35),
                      ProfileList(),
                      SizedBox(height: 35),
                      Text(
                        'Profile Status',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          ProfileStatus(),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          ProfileCompletionStatus()
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Footer(),
        ],
      ),
    );
  }
}
