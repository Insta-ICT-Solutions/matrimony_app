import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/app_constants.dart';
import 'package:bright_weddings/View/New Client Registration/new_client_registration.dart';
import 'package:http/http.dart ' as http;

class AuthController extends GetxController {
  var phoneController = TextEditingController();
  var otpController = TextEditingController();
  var otpSent = false.obs;
  var isRememberMeChecked = false.obs;

  // Toggle Remember Me Checkbox
  void toggleRememberMe() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }


  // Send Phone Number to API
  Future<void> sendPhoneNumber() async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + verifyOtp),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": phoneController.text.trim(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        otpSent.value = true;
        Get.snackbar("Success", data["message"] ?? "OTP sent successfully!");
      } else {
        final error = jsonDecode(response.body);
        Get.snackbar("Error", error["message"] ?? "Failed to send OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  // Verify OTP with API
  Future<void> verifyOTP() async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + verifyOtp),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": phoneController.text.trim(),
          "otp": otpController.text.trim(),
        }),
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        final data = jsonDecode(response.body);
        Get.snackbar(
            "Success", data["message"] ?? "OTP verified successfully!");
        // Navigate to next page after success
        Get.to(() => NewClientRegistration(), transition: Transition.fadeIn);
      } else {
        final error = jsonDecode(response.body);
        Get.snackbar("Error", error["message"] ?? "OTP verification failed");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}
