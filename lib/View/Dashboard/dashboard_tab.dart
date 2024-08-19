import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/Recent_Success/recent_success_tab.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/profile_list_tab.dart';
import 'package:bright_weddings/Component/Dashboard/sidebar.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/Dashboard/Success_Rate_View/success_rate_view_tab.dart';
import '../../Component/Dashboard/new_profile.dart';
import '../../Component/Dashboard/profile_completion_status.dart';
import '../../Component/Dashboard/profile_list/profile_list.dart';
import '../../Component/Dashboard/profile_status.dart';
import '../../Component/Dashboard/Recent_Success/recent_success.dart';
import '../../Component/Dashboard/success_graph.dart';
import '../../Mock API/user_list.dart';

class DashboardTab extends StatelessWidget {
  DashboardTab({super.key});

  final ScreenController controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Builder(builder: (bodyContext) {
        return Padding(
          padding: EdgeInsets.all(2.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sidebar(),
              SizedBox(width: 5.w),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'New Profile',
                      style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 2.0.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3.0.h),
                    NewProfile(
                      bodyContext: bodyContext,
                    ),
                    SizedBox(height: 3.0.h),
                    Text(
                      'Success Rate',
                      style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 2.0.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3.0.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SuccessRateViewTab(),
                            SizedBox(
                              height: 1.h,
                            ),
                            SuccessGraph()
                          ],
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        Text(
                          'Recent Success',
                          style: GoogleFonts.playfairDisplay(
                              color: textColor,
                              fontSize: 2.0.t,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        RecentSuccessTab(userList: userList)
                      ],
                    ),
                    SizedBox(height: 35),
                    Text(
                      'Profile List',
                      style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 2.0.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 35),
                    ProfileListTab(),
                    SizedBox(height: 35),
                    Text(
                      'Profile Status',
                      style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 2.0.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 35),
                    Column(
                      children: [
                        ProfileStatus(),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        ProfileCompletionStatus()
                      ],
                    ),
                    Footer()
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
