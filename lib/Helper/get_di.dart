

import 'package:bright_weddings/Controller/auth_controller.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:get/get.dart';

Future<void> init() async{
  Get.lazyPut(()=>AuthController(), fenix: true);
  Get.lazyPut(()=>NewRegistrationController(), fenix: true);
  Get.lazyPut(()=>ScreenController(), fenix: true);
  Get.lazyPut(()=>ProfileController(), fenix: true);
}