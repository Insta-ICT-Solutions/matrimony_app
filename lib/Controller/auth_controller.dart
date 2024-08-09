import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  var isRememberMeChecked = false.obs;

  void toggleRememberMe() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }

}