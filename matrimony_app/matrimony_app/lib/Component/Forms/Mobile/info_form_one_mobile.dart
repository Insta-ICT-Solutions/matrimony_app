
// import 'package:bright_weddings/Component/Buttons/hollow_button.dart';
// import 'package:bright_weddings/Component/Buttons/submit_button.dart';
// import 'package:bright_weddings/Component/TextFields/input_field.dart';
// import 'package:bright_weddings/Controller/new_registration_controller.dart';
// import 'package:bright_weddings/Helper/colors.dart';
// import 'package:bright_weddings/Helper/path_constants.dart';
// import 'package:bright_weddings/Helper/size_config.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class InfoFormOneMobile extends StatelessWidget {
//   final VoidCallback onNext;
//
//   InfoFormOneMobile({super.key, required this.onNext});
//
//   final NewRegistrationController controller =
//   Get.find<NewRegistrationController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         height: 60.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFF3E5F5), Color(0xFFE8EAF6)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade300,
//               blurRadius: 8,
//               offset: Offset(2, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Left Section with Text and Image
//             Container(
//               padding: EdgeInsets.all(3.h),
//               width: 30.w,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFB39DDB), Color(0xFF9575CD)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15.0),
//                   bottomLeft: Radius.circular(15.0),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Spacer(),
//                   Text(
//                     "Now",
//                     style: GoogleFonts.playfairDisplay(
//                       color: Colors.white,
//                       fontSize: 1.8.t,
//                     ),
//                   ),
//                   Text(
//                     "Find\nyour life\npartner",
//                     style: GoogleFonts.playfairDisplay(
//                       color: Colors.white,
//                       fontSize: 2.8.t,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Easy and fast.",
//                     style: GoogleFonts.playfairDisplay(
//                       color: Colors.white70,
//                       fontSize: 1.8.t,
//                     ),
//                   ),
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       loginCouplePNG,
//                       width: 20.w,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Right Section with Form
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(3.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title
//                     Text(
//                       "ADD NEW ONE",
//                       style: GoogleFonts.poppins(
//                         fontSize: 1.2.t,
//                         color: textColor,
//                       ),
//                     ),
//                     Text(
//                       "Get on to the Journey",
//                       style: GoogleFonts.playfairDisplay(
//                         fontSize: 2.4.t,
//                         color: Color(0xFF333333),
//                       ),
//                     ),
//                     SizedBox(height: 1.5.h),
//                     Divider(color: borderColor),
//                     SizedBox(height: 1.3.h),
//
//                     // Form Fields
//                     _buildLabel("Name:"),
//                     _buildInputField(
//                       "Enter Full Nameeee",
//                       controller.nameController,
//                       TextInputType.text,
//                       labelTextStyle: TextStyle(
//                         fontSize: 5.0.h, // Custom font size
//                         color: Colors.grey, // Custom color
//                       ),
//                     ),
//
//                     _buildSpacing(),
//                     _buildTwoColumnRow(
//                       context,
//                       leftTitle: "Birthdate:",
//                       leftWidget: Obx(
//                             () => HollowButton(
//                           title: controller.formattedDate.value,
//                           onTap: () => controller.pickDate(context),
//                           height: 3.0.h,
//                           width: 20.w,
//                         ),
//                       ),
//                       rightTitle: "Upload photo:",
//                       rightWidget: Obx(
//                             () => HollowButton(
//                           title: controller.selectedFileName.value,
//                           onTap: () => controller.pickFile(FileType.image),
//                           height: 3.0.h,
//                           width: 20.w,
//                         ),
//                       ),
//                     ),
//
//                     _buildSpacing(),
//                     _buildLabel("Gender:"),
//                     Obx(() => HollowButton(
//                       title: controller.selectedGender.value,
//                       onTap: () =>
//                           controller.showPopUpGender(context),
//                       height: 3.0.h,
//                       width: double.infinity,
//                     )),
//
//                     _buildSpacing(),
//                     _buildLabel("Address:"),
//                     _buildInputField(
//                       "Enter Address",
//                       controller.addressController,
//                       TextInputType.text,
//                       labelTextStyle: TextStyle(
//                         fontSize: 18, // Custom font size
//                         color: Colors.grey, // Custom color
//                       ),
//                     ),
//
//                     _buildSpacing(),
//                     _buildLabel("Phone Number:"),
//                     _buildInputField(
//                       "Enter Phone Number",
//                       controller.phoneController,
//                       TextInputType.number,
//                       labelTextStyle: TextStyle(
//                         fontSize: 18, // Custom font size
//                         color: Colors.grey, // Custom color
//                       ),
//                     ),
//
//                     _buildSpacing(),
//                     _buildLabel("Email ID:"),
//                     _buildInputField(
//                       "Enter Email ID",
//                       controller.emailIDController,
//                       TextInputType.emailAddress,
//                       labelTextStyle: TextStyle(
//                         fontSize: 18, // Custom font size
//                         color: Colors.grey, // Custom color
//                       ),
//                     ),
//
//                     Spacer(),
//                     Center(
//                       child: SubmitButton(
//                         title: "Save & next",
//                         onTap: onNext,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLabel(String label) {
//     return Text(
//       label,
//       style: GoogleFonts.poppins(
//         fontSize: 1.0.t,
//         color: Colors.black,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
//
//   Widget _buildInputField(String hintText, TextEditingController controller,
//       TextInputType keyboardType, {required TextStyle labelTextStyle}) {
//     return InputField(
//       labelText: hintText,
//       controller: controller,
//       keyboardType: keyboardType,
//       height: 4.h,
//       labelTextStyle: TextStyle(
//         fontSize: 1.2.h, // Custom font size
//         // color: Colors.grey, // Custom color
//       ),
//     );
//   }
//
//   Widget _buildTwoColumnRow(BuildContext context,
//       {required String leftTitle,
//         required Widget leftWidget,
//         required String rightTitle,
//         required Widget rightWidget}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildLabel(leftTitle),
//             SizedBox(height: 0.5.h),
//             leftWidget,
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildLabel(rightTitle),
//             SizedBox(height: 0.5.h),
//             rightWidget,
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSpacing() => SizedBox(height: 1.5.h);
// }

import 'package:bright_weddings/Component/Buttons/hollow_button.dart';
import 'package:bright_weddings/Component/Buttons/submit_button.dart';
import 'package:bright_weddings/Component/TextFields/input_field.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/path_constants.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoFormOneMobile extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  InfoFormOneMobile({super.key, required this.onBack, required this.onNext});

  final NewRegistrationController controller = Get.find<NewRegistrationController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF3E5F5), Color(0xFFE8EAF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB39DDB), Color(0xFF9575CD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Now",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black54, fontSize: 16),
                ),
                Text(
                  "Find your\nlife partner",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Easy and fast.",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    loginCouplePNG,
                    width: screenWidth * 0.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Form Section
          Text(
            "JUST FEW THINGS MORE",
            style: GoogleFonts.poppins(fontSize: 14, color: textColor),
          ),
          Text(
            "Continue the Journey",
            style: GoogleFonts.playfairDisplay(
                fontSize: 18, color: Color(0xFF333333)),
          ),
          SizedBox(height: 16),
          Divider(color: borderColor),
          SizedBox(height: 16),

          // Input Fields
          _buildTextField("Name:", "Enter Full Name", controller.nameController),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blood group:",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Builder(builder: (context) {
                      return Obx(() => HollowButton(
                          title: controller.formattedDate.value,
                          onTap: () {
                            controller.pickDate(context);
                          },
                          height: 8.0.h,
                          width: 25.0.w
                      ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload photo:",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Builder(builder: (context) {
                      return  HollowButton(
                          title: controller.selectedFileName.value,
                          onTap: () {
                            controller.pickFile(FileType.image);
                          },
                          height: 8.0.h,
                          width: 25.0.w
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender:",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Builder(builder: (context) {
                      return  HollowButton(
                          title: controller.selectedGender.value,
                          onTap: () {
                            controller.showPopUpGender(context);
                          },
                          height: 8.0.h,
                          width: 25.0.w
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          _buildTextField("Address:", "Enter Address", controller.addressController),
          _buildTextField("Phone Number:", "Enter Phone Number", controller.phoneController),
          _buildTextField("Email ID::", " Enter Email ID:", controller.emailIDController),

          SizedBox(height: 24),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 4.h,width: 25.w, child: SubmitButton(title: "Save & next", onTap: onNext))


            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          InputField(
            labelText: hintText,
            controller: controller,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
