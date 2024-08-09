import 'package:bright_weddings/Component/Buttons/submit_button.dart';
import 'package:bright_weddings/Component/TextFields/input_field.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/path_constants.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoFormTwo extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback? onNext;
  InfoFormTwo({super.key, required this.onBack, this.onNext});

  final NewRegistrationController controller = Get.find<NewRegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 130.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(3.h),
            width: 35.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  gradient1Color,
                  gradient2Color,
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Now", style: GoogleFonts.playfairDisplay(
                    color: textColor,
                    fontSize: 1.8.t
                ),),
                Text("Find\nyour life\npartner", style: GoogleFonts.playfairDisplay(
                    color: textColor,
                    fontSize: 2.8.t,
                    fontWeight: FontWeight.bold
                ),),
                Text("Easy and fast.", style: GoogleFonts.playfairDisplay(
                    color: textColor,
                    fontSize: 1.8.t
                ),),
                SizedBox(
                  height: 4.0.h,
                ),
                Image.asset(loginCouplePNG, width: 240,)
              ],
            ),
          ),
          Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    vertical: 3.0.h,
                    horizontal: 17.0.w
                ),
                children: [
                  Text("JUST FEW THINGS MORE", style: GoogleFonts.poppins(
                      fontSize: 1.2.t,
                      color: textColor
                  ),),
                  Text("Continue the Journey", style: GoogleFonts.playfairDisplay(
                      fontSize: 2.4.t,
                      color: Color(0xFF333333)
                  ),),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Divider(
                    color: borderColor,
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                  Text("Ras:", style: GoogleFonts.poppins(
                    fontSize: 0.9.t,
                    color: Colors.black,
                  ),),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  InputField(labelText: "Enter Ras", controller: controller.rasController, keyboardType: TextInputType.text),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text("Gan:", style: GoogleFonts.poppins(
                    fontSize: 0.9.t,
                    color: Colors.black,
                  ),),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  InputField(labelText: "Enter Gan", controller: controller.ganController, keyboardType: TextInputType.text),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text("Address:", style: GoogleFonts.poppins(
                    fontSize: 0.9.t,
                    color: Colors.black,
                  ),),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  InputField(labelText: "Enter Address", controller: controller.addressController, keyboardType: TextInputType.text),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text("Phone Number:", style: GoogleFonts.poppins(
                    fontSize: 0.9.t,
                    color: Colors.black,
                  ),),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  InputField(labelText: "Enter Phone Number", controller: controller.phoneController, keyboardType: TextInputType.text),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text("Education:", style: GoogleFonts.poppins(
                    fontSize: 0.9.t,
                    color: Colors.black,
                  ),),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  InputField(labelText: "Enter Education", controller: controller.educationController, keyboardType: TextInputType.text),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text("Demands:", style: GoogleFonts.poppins(
                    fontSize: 0.9.t,
                    color: Colors.black,
                  ),),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  InputField(labelText: "Enter Demands (Optional)", controller: controller.demandController, keyboardType: TextInputType.text),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  SubmitButton(title: "Save & next", onTap: onBack)
                ],
              ))
        ],
      ),
    );
  }
}
