import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Dashboard/New Profile/New_Profile_mobile.dart';
import '../../Component/Dashboard/New Profile/new_profile.dart';
import '../../Component/Dashboard/ProfileCompletionStatus/profile_completion_status.dart';
import '../../Component/Dashboard/ProfileStatus/profile_status.dart';
import '../../Component/Dashboard/ProfileStatus/profile_status_mobile.dart';
import '../../Component/Dashboard/Recent_Success/recent_success.dart';
import '../../Component/Dashboard/SuccessGraph/success_graph.dart';
import '../../Component/Dashboard/SuccessGraph/success_graph_mobile.dart';
import '../../Component/Dashboard/Success_Rate_View/success_rate_mobile.dart';
import '../../Component/Dashboard/Success_Rate_View/success_rate_view.dart';
import '../../Component/Dashboard/image_card.dart';
import '../../Component/Dashboard/profile_list/profile_list.dart';
import '../../Component/Dashboard/profile_list/profile_list_Mobile.dart';
import '../../Component/Dashboard/success_story/Mobile/Success_story_mobile.dart';
import '../../Component/Dashboard/success_story/dashboard_success_story.dart';
import '../../Component/footer_mobile.dart';
import '../../Component/profile_settings_card.dart';
import '../../Component/profile_settings_card_mobile.dart';
import '../../Helper/colors.dart';
import '../../Mock API/user_list.dart';
import '../New Client Registration/new_client_registration_mobile.dart';
import '../Profile/ProfileSettings/profile_settings.dart';
import '../Profile/profiles.dart';
import '../Profile/profiles_Mobile.dart';
import '../welcome_page/WelcomePageResponsive/Welcome_page_Mobile.dart';

class DashboardMobile extends StatelessWidget {
  DashboardMobile({super.key});

  final GlobalKey _newProfileKey = GlobalKey();
  final GlobalKey _successRateKey = GlobalKey();
  final GlobalKey _profileListKey = GlobalKey();
  final GlobalKey _profileSettingsKey = GlobalKey();
  final GlobalKey _profileStatusKey = GlobalKey();
  final GlobalKey _successStoryKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 2.5.w,
                  backgroundColor: darkYellowColor,
                  child: Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 1.7.h,
                  ),
                ),
              ),
              SizedBox(
                width: 1.35.h,
              ),
              Text(
                "BRIGHT ",
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: headerTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "WEDDINGS",
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: const Color(0xFFE53E3E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFC97799),
          child: Column(
            children: [
              DrawerHeader(
                child: Row(  // Use Row to arrange photo and name horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,  // Align vertically centered
                  children: [
                    // Profile Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
                        width: 35.w,  // Adjust based on screen size
                        height: 32.h,  // Keep the image square
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 2.w),  // Space between image and name

                    // Name and Age
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vaibhav Alone",
                          style: TextStyle(
                            fontSize: 2.5.t,  // Adjust text size as needed
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          "Age: 25",  // Replace with dynamic data if needed
                          style: TextStyle(
                            fontSize: 2.t,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.5.h),
              _buildDrawerItem(
                context,
                icon: Icons.dashboard,
                text: 'Dashboard',
                index: 0,
              ),
              _buildDrawerItem(
                context,
                icon: Icons.person,
                text: 'Profile',
                index: 1,
              ),
              _buildDrawerItem(
                context,
                icon: Icons.list,
                text: 'Profile List',
                index: 2,
              ),
              _buildDrawerItem(
                context,
                icon: Icons.settings,
                text: 'Profile Settings',
                index: 3,
              ),
              _buildDrawerItem(
                context,
                icon: Icons.incomplete_circle,
                text: 'Profile Status',
                index: 4,
              ),
              _buildDrawerItem(
                context,
                icon: Icons.handshake,
                text: 'Success Story',
                index: 5,
              ),
              ListTile(
                leading: Icon(Icons.app_registration, color: Colors.white), // Registration icon
                title: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  // Navigate to the Register page or perform registration actions
                  _navigateToRegister(context);
                },
              ),



              ListTile(
                leading: Icon(Icons.logout, color: Colors.white), // Logout icon
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  // Perform the logout operation here
                  _logout(context);
                },
              ),

            ],
          ),
        ),
      ),


// Function to build Drawer items


    body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // New Profile Section
              Container(
                key: _newProfileKey,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with Decoration
                    Text(
                      'New Profile',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.black87,
                        fontSize: 2.5.t,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 2.0.h),
                    // Profile List
                    NewProfileMobile(
                      bodyContext: context,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.0.h),

              // Success Rate and Recent Success Titles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Success Rate',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.black87,
                      fontSize: 1.8.t,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade400,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Recent Success',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.black87,
                      fontSize: 1.8.t,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade400,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0.h),

              // Success Rate and Recent Success Section
              Container(
                key: _successRateKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Success Rate
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Placeholder for SuccessRateView Widget
                          SuccessRateViewMobile(),
                          SizedBox(height: 2.h),
                          // Placeholder for SuccessGraph Widget
                          SuccessGraphMobile(),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      // Recent Success
                      RecentSuccess(userList: userList),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 3.0.h),
              Container(
                key: _profileListKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => ProfilesMobile());
                      },
                      child: Text(
                        'Profile List',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.0.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            padding: EdgeInsets.all(8.w),
                            height: 50.h,
                            width: 90.0.w,
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
                            child: ProfileListMobile(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.0.h),
              Container(
                key: _profileStatusKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Status',
                      style: GoogleFonts.playfairDisplay(
                        color: textColor,
                        fontSize: 1.5.t,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3.0.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProfileStatusMobile(),
                          SizedBox(width: 5.0.w),
                          ProfileCompletionStatus(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.0.h),
              Container(
                key: _profileSettingsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => ProfileSettingsPage());
                      },
                      child: Text(
                        'Profile Settings',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.0.h),
                    ProfileSettingsCardMobile(),
                  ],
                ),
              ),

              SizedBox(height: 3.0.h),
              Container(
                key: _successStoryKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => ProfileSettingsPage());
                      },
                      child: Text(
                        'Success Stories',
                        style: GoogleFonts.playfairDisplay(
                          color: textColor,
                          fontSize: 1.5.t,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.0.h),
                    DashboardSuccessStoryMobile(),

                    SizedBox(height: 13.0.h),

                  ],
                ),
              ),

              // Add FooterMobile() here below the Success Stories section
              FooterMobile(),

            ],
          ),
        ),
      ),
    );

  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String text, required int index}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Close the drawer
        _scrollToSection(index);
      },
    );
  }

  void _scrollToSection(int index) {
    final Map<int, GlobalKey> sectionKeys = {
      0: _newProfileKey,
      1: _successRateKey,
      2: _profileListKey,
      3: _profileSettingsKey,
      4: _profileStatusKey,
      5: _successStoryKey,
    };

    final key = sectionKeys[index];
    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}


void _logout(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog if there is one

              // Navigate to WelcomePageMobile
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WelcomePageMobile()),
              );
            },
            child: Text("Logout"),
          ),

        ],
      );
    },
  );
}


void _navigateToRegister(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => NewClientRegistrationMobile()), // Replace with your actual RegisterPage
  );
}
