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
// class InfoFormOne extends StatelessWidget {
//   final VoidCallback onNext;
//
//   InfoFormOne({super.key, required this.onNext});
//
//   final NewRegistrationController controller = Get.find<NewRegistrationController>();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55.h,
//       width: 130.w,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(3.h),
//             width: 35.w,
//             decoration: BoxDecoration(
//                 color: Color(0xFFE5D7F6),
//                 // color: Color(0xFFFFFAA0),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.0),
//                   bottomLeft: Radius.circular(10.0),
//                 )),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Now",
//                   style: GoogleFonts.playfairDisplay(
//                       color: Color(0xFF2F2F2F),
//                       fontSize: 1.8.t),
//                 ),
//                 Text(
//                   "Find\nyour life\npartner",
//                   style: GoogleFonts.playfairDisplay(
//                       // color: textColor,
//                       color: Color(0xFF36015D),
//                       fontSize: 2.8.t,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "Easy and fast.",
//                   style: GoogleFonts.playfairDisplay(
//                       color: Color(0xFF2F2F2F),
//                       fontSize: 1.8.t),
//                 ),
//                 SizedBox(
//                   height: 4.0.h,
//                 ),
//                 Image.asset(
//                   loginCouplePNG,
//                   width: 240,
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//               child: ListView(
//             physics: NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 17.0.w),
//             children: [
//               Text(
//                 "ADD NEW ONE",
//                 style: GoogleFonts.poppins(fontSize: 1.2.t, color: textColor),
//               ),
//               Text(
//                 "Get on to the Journey",
//                 style: GoogleFonts.playfairDisplay(
//                     fontSize: 2.4.t, color: Color(0xFF333333)),
//               ),
//               SizedBox(
//                 height: 2.0.h,
//               ),
//               Divider(
//                 color: borderColor,
//               ),
//               SizedBox(
//                 height: 1.3.h,
//               ),
//               Text(
//                 "Name:",
//                 style: GoogleFonts.poppins(
//                     fontSize: 0.9.t,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 0.5.h,
//               ),
//               InputField(
//                   labelText: "Enter Full Name",
//                   controller: controller.nameController,
//                   keyboardType: TextInputType.text),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Birthdate:",
//                         style: GoogleFonts.poppins(
//                             fontSize: 0.9.t,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 0.5.h,
//                       ),
//                       Obx(
//                         () => HollowButton(
//                             title: controller.formattedDate.value,
//                             onTap: () {
//                               controller.pickDate(context);
//                             },
//                             height: 3.0.h,
//                             width: 15.0.w),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 5.0.w,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Upload photo:",
//                         style: GoogleFonts.poppins(
//                             fontSize: 0.9.t,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 0.5.h,
//                       ),
//                       Obx(
//                         () => HollowButton(
//                             title: controller.selectedFileName.value,
//                             onTap: () {
//                               controller.pickFile(FileType.image);
//                             },
//                             height: 3.0.h,
//                             width: 17.0.w),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 4.0.w,
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Gender:",
//                         style: GoogleFonts.poppins(
//                           fontSize: 0.9.t,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 0.5.h,
//                       ),
//                       Builder(builder: (buttonContext) {
//                         return Obx(() => HollowButton(
//                             title: controller.selectedGender.value,
//                             onTap: () {
//                               controller.showPopUpGender(buttonContext);
//                             },
//                             height: 3.0.h,
//                             width: 20.0.w
//                         )
//                         );
//                       }),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               Text(
//                 "Address:",
//                 style: GoogleFonts.poppins(
//                     fontSize: 0.9.t,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 0.5.h,
//               ),
//               InputField(
//                   labelText: "Enter Address",
//                   controller: controller.addressController,
//                   keyboardType: TextInputType.text),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               Text(
//                 "Phone Number:",
//                 style: GoogleFonts.poppins(
//                     fontSize: 0.9.t,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 0.5.h,
//               ),
//               InputField(
//                   labelText: "Enter Phone Number",
//                   controller: controller.phoneController,
//                   keyboardType: TextInputType.text),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               Text(
//                 "Email ID:",
//                 style: GoogleFonts.poppins(
//                     fontSize: 0.9.t,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 0.5.h,
//               ),
//               InputField(
//                   labelText: "Enter Email ID",
//                   controller: controller.emailIDController,
//                   keyboardType: TextInputType.text),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               SizedBox(
//                 height: 5.0.h,
//               ),
//               SubmitButton(
//                   title: "Save & Next",
//                   onTap: () async {
//                     // Call the submit method to send the data to the backend
//
//                     await controller.submitFormData();
//
//                     onNext();  // Make sure 'onNext' performs the correct navigation to the next step
//                   }
//               )
//
//             ],
//           ))
//         ],
//       ),
//     );
//   }
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

class InfoFormOne extends StatelessWidget {
  final VoidCallback onNext;

  InfoFormOne({super.key, required this.onNext});

  final NewRegistrationController controller = Get.find<NewRegistrationController>();

  // Function to show validation errors
//   void showErrorDialog(String message) {
//     Get.dialog(
//       AlertDialog(
//         title: Text("Validation Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Get.back(); // Close the dialog
//             },
//               child: Text(
//                 "OK",
//                 style: TextStyle(
//                   color: Colors.red,
//                 ),
//               )
//           ),
//         ],
//       ),
//       barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
//     );
//   }
//
//   // Function to validate all fields before submission
//   bool validateForm() {
//     // Validate Name
//     if (controller.nameController.text.trim().isEmpty) {
//       showErrorDialog("Name cannot be empty");
//       return false;
//     }
//
//     // Validate Birthdate
//     if (controller.formattedDate.value.isEmpty) {
//       showErrorDialog("Birthdate cannot be empty");
//       return false;
//     }
//
//     // Validate File (Photo Upload)
//     if (controller.selectedFileName.value.isEmpty) {
//       showErrorDialog("Please upload a photo");
//       return false;
//     }
//
//     // Validate Gender
//     if (controller.selectedGender.value.isEmpty) {
//       showErrorDialog("Gender cannot be empty");
//       return false;
//     }
//
//     // Validate Address
//     if (controller.addressController.text.trim().isEmpty) {
//       showErrorDialog("Address cannot be empty");
//       return false;
//     }
//
//     // Validate Phone Number
//     if (controller.phoneController.text.trim().isEmpty) {
//       showErrorDialog("Phone number cannot be empty");
//       return false;
//     }
//
// // Check if the phone number contains only digits
//     String phoneNumber = controller.phoneController.text.trim();
//
// // Check if the phone number contains only digits and has exactly 10 characters
//     RegExp regExp = RegExp(r'^[0-9]+$');
//     int phoneLength = phoneNumber.length;  // Get the length of the phone number
//
//     if (!regExp.hasMatch(phoneNumber) || phoneLength != 10) {
//       showErrorDialog("Phone number must be a valid 10-digit number");
//       return false;
//     }
//
//
//     // Validate Email
//     if (controller.emailIDController.text.trim().isEmpty ||
//         !GetUtils.isEmail(controller.emailIDController.text.trim())) {
//       showErrorDialog("Please enter a valid email address");
//       return false;
//     }
//
//     return true;
//   }

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
                      color: Color(0xFF2F2F2F),
                      fontSize: 1.8.t),
                ),
                Text(
                  "Find\nyour life\npartner",
                  style: GoogleFonts.playfairDisplay(
                      color: Color(0xFF36015D),
                      fontSize: 2.8.t,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Easy and fast.",
                  style: GoogleFonts.playfairDisplay(
                      color: Color(0xFF2F2F2F),
                      fontSize: 1.8.t),
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
                  "ADD NEW ONE",
                  style: GoogleFonts.poppins(fontSize: 1.2.t, color: textColor),
                ),
                Text(
                  "Get on to the Journey",
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
                // Name field
                Text(
                  "Name:",
                  style: GoogleFonts.poppins(
                      fontSize: 0.9.t,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                InputField(
                    labelText: "Enter Full Name",
                    controller: controller.nameController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 1.5.h,
                ),
                // Birthdate, Upload photo, Gender fields
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Birthdate field
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Birthdate:",
                          style: GoogleFonts.poppins(
                              fontSize: 0.9.t,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Obx(
                              () => HollowButton(
                            title: controller.formattedDate.value,
                            onTap: () {
                              controller.pickDate(context);
                            },
                            height: 3.0.h,
                            width: 15.0.w,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    // Upload Photo field
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Upload photo:",
                          style: GoogleFonts.poppins(
                              fontSize: 0.9.t,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Obx(
                              () => HollowButton(
                            title: controller.selectedFileName.value,
                            onTap: () {
                              controller.pickFile(FileType.image);
                            },
                            height: 3.0.h,
                            width: 17.0.w,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 4.0.w,
                    ),
                    // Gender field
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender:",
                          style: GoogleFonts.poppins(
                            fontSize: 0.9.t,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Builder(builder: (buttonContext) {
                          return Obx(() => HollowButton(
                              title: controller.selectedGender.value,
                              onTap: () {
                                controller.showPopUpGender(buttonContext);
                              },
                              height: 3.0.h,
                              width: 20.0.w));
                        }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                // Address field
                Text(
                  "Address:",
                  style: GoogleFonts.poppins(
                      fontSize: 0.9.t,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                InputField(
                    labelText: "Enter Address",
                    controller: controller.addressController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 1.5.h,
                ),
                // Phone Number field
                Text(
                  "Phone Number:",
                  style: GoogleFonts.poppins(
                      fontSize: 0.9.t,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                InputField(
                    labelText: "Enter Phone Number",
                    controller: controller.phoneController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 1.5.h,
                ),
                // Email field
                Text(
                  "Email ID:",
                  style: GoogleFonts.poppins(
                      fontSize: 0.9.t,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                InputField(
                    labelText: "Enter Email ID",
                    controller: controller.emailIDController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                // Save & Next button
                SubmitButton(
                  title: "Save & Next",
                  onTap: () async {
                    // Validate the form before proceeding
                    // if (controller.validateForm()) {
                    //   await controller.submitFormData();
                    //   onNext(); // Proceed to the next step if validation is successful
                    // }

                    await controller.submitFormData();
                    onNext(); // Proceed to the next step if validation is successful
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
