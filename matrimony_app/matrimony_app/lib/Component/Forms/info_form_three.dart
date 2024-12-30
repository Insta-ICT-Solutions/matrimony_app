import 'package:bright_weddings/Component/Buttons/hollow_button.dart';
import 'package:bright_weddings/Component/Buttons/submit_button.dart';
import 'package:bright_weddings/Component/TextFields/input_field.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/path_constants.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoFormThree extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback? onNext;

  InfoFormThree({super.key, required this.onBack, this.onNext});

  @override
  State<InfoFormThree> createState() => _InfoFormThreeState();
}

class _InfoFormThreeState extends State<InfoFormThree> {
  final NewRegistrationController controller =
      Get.find<NewRegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 130.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(3.h),
            width: 35.w,
            decoration: BoxDecoration(
                color: Color(0xFFE5D7F6),
                // color: Color(0xFFFFFAA0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Now",
                  style: GoogleFonts.playfairDisplay(
                      color: Color(0xFF2F2F2F), fontSize: 1.8.t),
                ),
                Text(
                  "Find\nyour life\npartner",
                  style: GoogleFonts.playfairDisplay(
                      // color: textColor,
                      color: Color(0xFF36015D),
                      fontSize: 2.8.t,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Easy and fast.",
                  style: GoogleFonts.playfairDisplay(
                      color: Color(0xFF2F2F2F), fontSize: 1.8.t),
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Image.asset(
                  loginCouplePNG,
                  width: 240,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 17.0.w),
            children: [
              Text(
                "JUST FEW THINGS MORE",
                style: GoogleFonts.poppins(fontSize: 1.2.t, color: textColor),
              ),
              Text(
                "Continue the Journey",
                style: GoogleFonts.playfairDisplay(
                    fontSize: 2.4.t, color: Color(0xFF333333)),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Divider(
                color: borderColor,
              ),
              SizedBox(
                height: 1.3.h,
              ),
              Text(
                "Education:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              InputField(
                  labelText: "Enter Education",
                  controller: controller.educationController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Job:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              InputField(
                  labelText: "Enter Job",
                  controller: controller.jobController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Marriage Status:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (buttonContext) {
                      return Obx(() => HollowButton(
                          title: controller.selectedMarriage.value,
                          onTap: () {
                            controller.showPopUpMarriage(buttonContext);
                          },
                          height: 3.0.h,
                          width: 20.0.w));
                    }),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          controller
                              .toggleVip(); // Use the controller to toggle the state
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isVip
                            ? Colors.yellowAccent // Yellow-golden color when active
                            : Colors.grey, // Default color
                        padding: EdgeInsets
                            .zero, // Remove default padding to control the size with height and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              1.w), // Slightly rounded corners
                        ),
                        elevation: 8, // Add shadow for a more attractive look
                      ),
                      child: SizedBox(
                        height: 3.0.h,
                        width: 20.0.w,
                        child: Center(
                          child: Text(
                            "VIP Client",
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontWeight: FontWeight.bold,
                              fontSize: 1.t, // Responsive text size
                              letterSpacing:
                                  0.2.w, // Slightly spaced-out letters
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 1.5.h,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Go back button
                  Container(
                    width: 24.0.w,
                    child: SubmitButton(title: "Go back", onTap: widget.onBack),
                  ),
                  // Save & Navigate to Dashboard button
                  Container(
                    width: 24.0.w,
                    child: SubmitButton(
                      title: "Save & Next",
                      onTap: () async {
                        // Call the submit method to send the data to the backend
                        await controller.submitFormData();

                        // if (controller.validateForm3()) {
                        //   await controller.submitFormData();
                        // }

                        // Once the data is submitted, navigate to the Dashboard
                        // Navigate to the Dashboard page
                      },
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
