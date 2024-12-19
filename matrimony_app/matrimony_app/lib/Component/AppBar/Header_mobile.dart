import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helper/colors.dart';
import '../../View/Login/login.dart';
import '../../View/Dashboard/dashboard.dart';
import '../../View/New Client Registration/new_client_registration.dart';

class HeaderMobile extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final bool? showDashboard;
  final bool? showLogin;
  final bool? showRegistration;

  HeaderMobile({
    Key? key,
    this.onNext,
    this.onBack,
    this.showDashboard,
    this.showLogin,
    this.showRegistration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.25),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Conditionally show Back Button
          if (onBack != null)
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
              onPressed: onBack,
            ),

          // App Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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

          // Profile and Menu
          Row(
            children: [
              PopupMenuButton<String>(
                icon: Icon(Icons.menu, color: Colors.black),
                onSelected: (value) {
                  if (value == 'Next' && onNext != null) {
                    onNext!();
                  } else if (value == 'Back' && onBack != null) {
                    onBack!();
                  } else if (value == 'Dashboard' && showDashboard == true) {
                    Get.offAll(() => Dashboard());
                  } else if (value == 'Login' && showLogin == true) {
                    Get.offAll(() => LoginPage());
                  } else if (value == 'Register' && showRegistration == true) {
                    Get.offAll(() => NewClientRegistration());
                  }
                },
                offset: Offset(50, 50),
                itemBuilder: (BuildContext context) {
                  List<PopupMenuItem<String>> menuItems = [];

                  if (onNext != null) {
                    menuItems.add(PopupMenuItem(
                      value: 'Next',
                      child: Text('Next'),
                    ));
                  }
                  if (onBack != null) {
                    menuItems.add(PopupMenuItem(
                      value: 'Back',
                      child: Text('Back'),
                    ));
                  }
                  if (showDashboard == true) {
                    menuItems.add(PopupMenuItem(
                      value: 'Dashboard',
                      child: Text('Dashboard'),
                    ));
                  }
                  if (showLogin == true) {
                    menuItems.add(PopupMenuItem(
                      value: 'Login',
                      child: Text('Login'),
                    ));
                  }
                  if (showRegistration == true) {
                    menuItems.add(PopupMenuItem(
                      value: 'Register',
                      child: Text('Register'),
                    ));
                  }

                  return menuItems;
                },
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
