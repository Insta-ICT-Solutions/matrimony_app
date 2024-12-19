
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/Forms/login_form.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../Component/AppBar/Header_mobile.dart';
import '../../Component/AppBar/header.dart';
import '../../Component/footer_mobile.dart';
import '../../Helper/colors.dart';
import 'package:bright_weddings/Component/Buttons/submit_button.dart';
import 'package:bright_weddings/Component/TextFields/input_field.dart';
import 'package:bright_weddings/Controller/auth_controller.dart';
import 'package:bright_weddings/View/New Client Registration/new_client_registration.dart';

import '../../Helper/path_constants.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  HeaderMobile(
        showDashboard: false,
        showLogin: false,
        showRegistration: false,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5.0.h,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFAA0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Now",
                                          style: GoogleFonts.playfairDisplay(
                                              color: textColor,
                                              fontSize: 1.8.t)),
                                      Text(
                                        "Find\nyour life\npartner",
                                        style: GoogleFonts.playfairDisplay(
                                            color: textColor,
                                            fontSize: 2.8.t,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Easy and fast.",
                                        style: GoogleFonts.playfairDisplay(
                                            color: textColor, fontSize: 1.8.t),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -100,
                                left: 110,
                                child: Image.asset(
                                  loginCouplePNG, // Ensure you have this image asset
                                  width: 240,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.0.h),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.0.h, horizontal: 17.0.w),
                              children: [
                                Text(
                                  "START THE JOURNEY",
                                  style: GoogleFonts.poppins(
                                      fontSize: 1.9.t, color: textColor),
                                ),
                                Text(
                                  "Sign in to Matrimony",
                                  style: GoogleFonts.playfairDisplay(
                                      fontSize: 2.9.t,
                                      color: Color(0xFF333333)),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Having trouble logging in? ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 1.9.t, color: textColor),
                                    children: [
                                      TextSpan(
                                        text: "Click here",
                                        style: GoogleFonts.poppins(
                                          fontSize: 1.9.t,
                                          color: Color(0xFF0B6DDB),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                    ],
                                  ),
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
                                  "Phone Number:",
                                  style: GoogleFonts.poppins(
                                    fontSize: 2.t,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                InputField(
                                  labelText: "Enter Phone Number",
                                  controller: controller.phoneController,
                                  keyboardType: TextInputType.phone,
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      EasyLoading.show(
                                          status: 'Sending OTP...');
                                      Future.delayed(Duration(seconds: 3))
                                          .then((_) {
                                        EasyLoading.dismiss();
                                        controller.otpSent(true);
                                        showDialog(
                                            barrierDismissible: true,
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Success!",
                                                  textAlign: TextAlign.center,
                                                ),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 8.w,
                                                      backgroundColor:
                                                          gradient2Color, // Ensure you have defined this color
                                                      child: Icon(
                                                        Icons.check_rounded,
                                                        color: textColor,
                                                        size: 10.w,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(
                                                        "OTP sent successfully!")
                                                  ],
                                                ),
                                              );
                                            });
                                      });
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: textColor,
                                    ),
                                    splashColor: Colors.transparent,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Obx(() => controller.otpSent.value
                                    ? Text(
                                        "OTP:",
                                        style: GoogleFonts.poppins(
                                          fontSize: 0.9.t,
                                          color: Colors.black,
                                        ),
                                      )
                                    : Container()),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Obx(() => controller.otpSent.value
                                    ? InputField(
                                        labelText: "Enter OTP",
                                        controller: controller.otpController,
                                        keyboardType: TextInputType.phone)
                                    : Container()),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Obx(() => Row(
                                      children: [
                                        Checkbox(
                                          side: BorderSide(
                                              color: darkBorderColor),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              side: BorderSide(
                                                  color: darkBorderColor)),
                                          value: controller
                                              .isRememberMeChecked.value,
                                          onChanged: (value) {
                                            controller.toggleRememberMe();
                                          },
                                          activeColor: darkBorderColor,
                                        ),
                                        Text(
                                          "Remember me",
                                          style: GoogleFonts.poppins(
                                            fontSize: 1.t,
                                            color: darkBorderColor,
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 4.0.h,
                                ),
                                SubmitButton(
                                    title: "Signup",
                                    onTap: () {
                                      Get.to(() => NewClientRegistration(),
                                          transition: Transition.fadeIn);
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                FooterMobile(),

              ],
            ),
            Positioned(
              top: 0,
              left: 2,
              child: Image(
                image: AssetImage('assets/images/leaves.png'),
                height: 17.h,
                width: 28.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
