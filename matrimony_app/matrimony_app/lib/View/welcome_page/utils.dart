import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class FontStyles{
  static TextStyle titleStyle =TextStyle(
      fontSize: 36,
      color: SysColor.redColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Title"

  );
  static TextStyle heading =TextStyle(
      fontSize: 50,
      color: SysColor.highlightColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Title"

  );
  static TextStyle normalText =TextStyle(
      fontSize: 26,
      color: SysColor.tileColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Body"

  );
  static TextStyle subTitleStyle =TextStyle(
      fontSize: 16,
      color: SysColor.tileColor,
      fontFamily: "SubTitle"
  );
  static TextStyle bodyText =TextStyle(
      fontSize: 16,
      color: SysColor.tileColor,
      fontFamily: "Body"
  );
  static TextStyle stepText =TextStyle(
    fontSize: 16,
    color: SysColor.redColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle welcomeText =TextStyle(
      color: Color(0xFFED4487),
      fontSize: 36,
      fontFamily: "Body",
      fontWeight: FontWeight.bold
  );

  static TextStyle whoWeAreText= GoogleFonts.pacifico(
    fontSize: 28,
    color: SysColor.blueShadeColor,
  );

  static TextStyle descriptionText= GoogleFonts.openSans(
    fontSize: 18,
    color: Colors.black,
  );

}

class Dimensions{

  static double widgetRadius = 15.0;
  static double iconDimensions = 25.0;
  static double inputHeight = 50.0;
  static double inputWidth = 170.0;

  static SizedBox get spacer40 => SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.04);
  static SizedBox get spacerWidth40 => SizedBox(height: MediaQuery.of(Get.context!).size.width * 0.04);
  static SizedBox get spacerMin => SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.01);
  static SizedBox get spacer100 => SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.1);
  static SizedBox get spacer50 => SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.05);

}
class SysColor{
  static Color tileColor = Color(0xFF424874);
  static Color backgroundColor = Color(0xFFFFFFFF);
  static Color redColor = Color(0xFFED4487);
  static Color pinkShade = Color(0xFFFF3659);
  static Color secBackColor = Color(0xFFCACFD6);
  static Color highlightColor = Color(0xFFDCD6F7);
  static Color blueShadeColor = Color(0xFF172774);
}