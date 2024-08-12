import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/Dashboard/new_profile.dart';
import '../../Component/Dashboard/profile_completion_status.dart';
import '../../Component/Dashboard/profile_list.dart';
import '../../Component/Dashboard/profile_status.dart';
import '../../Component/Dashboard/recent_success.dart';
import '../../Component/Dashboard/success_graph.dart';
import '../../Component/Dashboard/success_rate_view.dart';
import '../../Helper/colors.dart';
import '../../Mock API/user_list.dart';

class DashboardWeb extends StatelessWidget {
  const DashboardWeb({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
