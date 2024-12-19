import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Login/login.dart';
import 'package:bright_weddings/View/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helper/colors.dart';
import '../../View/Dashboard/dashboard.dart';
import '../../View/New Client Registration/new_client_registration.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final bool? showDashboard;
  final bool? showLogin;
  final bool? showRegistration;
  Header(
      {Key? key,
      this.onNext,
      this.onBack,
      this.showDashboard,
      this.showLogin,
      this.showRegistration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 6.0.h, // Using SizeConfig for height
      width: screenWidth,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: Offset(0, 4.0),
          blurRadius: 4.0,
        )
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 2.2.h,
            width: screenWidth,
            color: Colors.red[900],
            child: Builder(builder: (rowContext) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  onBack != null
                      ? IconButton(
                          onPressed: onBack,
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 0.9.t,
                          ))
                      : Container(),
                  onNext != null
                      ? IconButton(
                          onPressed: onNext,
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 0.9.t,
                          ))
                      : Container(),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "ABOUT",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "FAQ",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "CONTACT",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                  SizedBox(
                    width: 70.0.w,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "+91 1234567890",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "IT.TEAM.INSTAICT@GMAIL.COM",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                ],
              );
            }),
          ),
          Container(
            height: 3.8.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      fontSize: 0.8.t,
                      color: headerTitleColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "WEDDINGS",
                  style: GoogleFonts.poppins(
                      fontSize: 0.8.t,
                      // color: otherTextColor,
                      color: Color(0xFFE53E3E),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 90.0.w,
                ),
                showLogin == false
                    ? Container()
                    : TextButton(
                        onPressed: () {
                          Get.offAll(() => WelcomePage());
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return Color(
                                    0xFFE53E3E); // Change text color to red on hover
                              }
                              return Colors.black; // Default text color
                            },
                          ),
                          overlayColor: WidgetStateProperty.all(
                              Colors.transparent), // Remove hover box effect
                        ),
                        child: Text(
                          'Logout',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                showRegistration == false
                    ? Container()
                    : TextButton(
                        onPressed: () {
                          Get.offAll(() => NewClientRegistration());
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return Color(
                                    0xFFE53E3E); // Change text color to red on hover
                              }
                              return Colors.black; // Default text color
                            },
                          ),
                          overlayColor: WidgetStateProperty.all(
                              Colors.transparent), // Remove hover box effect
                        ),
                        child: Text(
                          'Register',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                showDashboard == false
                    ? Container()
                    : TextButton(
                        onPressed: () {
                          Get.offAll(() => Dashboard());
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return Color(
                                    0xFFE53E3E); // Change text color to red on hover
                              }
                              return Colors.black; // Default text color
                            },
                          ),
                          overlayColor: WidgetStateProperty.all(
                              Colors.transparent), // Remove hover box effect
                        ),
                        child: Text(
                          'Dashboard',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                SizedBox(
                  width: 10.0.w,
                ),
                CircleAvatar(
                  radius: 1.4.h,
                  backgroundColor: Color(0xFFEEB2B1),
                  child: Icon(
                    Icons.person, // Use Icons.person for a man icon
                    color: Colors.white, // Set the color of the icon
                    size: 1.2.h, // Adjust the size as needed
                  ),
                ),
                SizedBox(
                  width: 1.8.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ADVISOR",
                      style: GoogleFonts.inter(
                          color: Color(0xFF002379), fontSize: 0.7.t),
                    ),
                    Text(
                      "Ashley emyy",
                      style: GoogleFonts.inter(
                          color: headerTitleColor, fontSize: 1.0.t),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(6.0.h);
}
