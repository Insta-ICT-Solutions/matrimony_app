import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  const Header({super.key, this.onNext, this.onBack});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 6.0.h,
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
            color: headerTitleColor,
            child: Builder(builder: (rowContext) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  onBack!=null&&onNext!=null ? IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 0.9.t,)) : Container(),
                  onBack!=null&&onNext!=null ? IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 0.9.t,)) : Container(),
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
                      color: otherTextColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100.0.w,
                ),
                CircleAvatar(
                  radius: 1.4.h,
                  backgroundColor: Color(0xFFEEB2B1),
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
}
