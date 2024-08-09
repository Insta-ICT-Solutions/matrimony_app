import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewRegistrationController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController castController = TextEditingController();
  final TextEditingController subCastController = TextEditingController();
  final TextEditingController devakController = TextEditingController();
  final TextEditingController rasController = TextEditingController();
  final TextEditingController ganController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController demandController = TextEditingController();

  var currentFormIndex = 0.obs; // To keep track of the current form
}
