import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 6.0.h,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4.0),
            blurRadius: 4.0,
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            height: 2.2.h,
            width: screenWidth,
            color: headerTitleColor,
            child: Builder(builder: (rowContext){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(onPressed: (){}, child: Text("ABOUT", style: GoogleFonts.inter(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w300),)),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(onPressed: (){}, child: Text("FAQ", style: GoogleFonts.inter(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w300),)),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(onPressed: (){}, child: Text("CONTACT", style: GoogleFonts.inter(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w300),)),
                  SizedBox(
                    width: 70.0.w,
                  ),
                  TextButton(onPressed: (){}, child: Text("+91 1234567890", style: GoogleFonts.inter(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w300),)),
                  Container(
                    width: 1.0,
                    color: Colors.white,
                    height: MediaQuery.of(rowContext).size.height,
                  ),
                  TextButton(onPressed: (){}, child: Text("IT.TEAM.INSTAICT@GMAIL.COM", style: GoogleFonts.inter(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w300),)),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
