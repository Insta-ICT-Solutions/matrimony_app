import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/sidebar.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/Dashboard/new_profile.dart';
import '../../Component/Dashboard/profile_completion_status.dart';
import '../../Component/Dashboard/profile_list/profile_list.dart';
import '../../Component/Dashboard/profile_status.dart';
import '../../Component/Dashboard/Recent_Success/recent_success.dart';
import '../../Component/Dashboard/success_graph.dart';
import '../../Component/Dashboard/Success_Rate_View/success_rate_view.dart';
import '../../Mock API/user_list.dart';

class DashboardWeb extends StatelessWidget {
  DashboardWeb({super.key});

  final ScreenController controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: Header(),
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
                          fontSize: 1.5.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3.0.h),
                    NewProfile(
                      bodyContext: bodyContext,
                    ),
                    SizedBox(height: 3.0.h),
                    Row(
                      children: [
                        Text(
                          'Success Rate',
                          style: GoogleFonts.playfairDisplay(
                              color: textColor,
                              fontSize: 1.5.t,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 66.w,
                        ),
                        Text(
                          'Recent Success',
                          style: GoogleFonts.playfairDisplay(
                              color: textColor,
                              fontSize: 1.5.t,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
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
                    ),
                    SizedBox(height: 3.0.h),
                    Text(
                      'Profile List',
                      style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 3.0.h),
                          ProfileList(),
                          SizedBox(height: 3.0.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.0.h),
                    Text(
                      'Profile Status',
                      style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3.0.h),
                    Row(
                      children: [
                        ProfileStatus(),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        ProfileCompletionStatus()
                      ],
                    ),
                    SizedBox(height: 10.0.h),
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
