import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/Models/NewRegistrationModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/app_constants.dart';
import '../View/Dashboard/dashboard.dart';

class NewRegistrationController extends GetxController {
  // Step 1: Basic Information
  final TextEditingController nameController = TextEditingController();
  final TextEditingController castController = TextEditingController();
  final TextEditingController subCastController = TextEditingController();
  final TextEditingController devakController = TextEditingController();
  final TextEditingController rasController = TextEditingController();
  final TextEditingController ganController = TextEditingController();

  // Step 2: Contact and Education
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailIDController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  // Step 3: Additional Details
  final TextEditingController demandController = TextEditingController();

  var selectedBloodGroup = "A+".obs;
  var selectedGender = "male".obs;
  var selectedMarriage = "First".obs;
  var selectedFile = Rxn<PlatformFile>();
  var selectedFileName = "Upload Photo".obs;
  var selectedDate = Rxn<DateTime>();
  var formattedDate = 'Select Date'.obs;
  var selectedFileUnicode = ''.obs;

  // Navigation management
  var currentFormIndex = 0.obs;

  // Dropdown values
  var bloodGroups = <String>["A+", "B+", "AB+", "O+", "A-", "B-", "AB-", "O-"];
  var gender = <String>["male", "female"];
  var marriagestatus = <String>["first", "second"];

  // Navigate to the next step
  void goToNextStep() {
    if (currentFormIndex.value < 2) {
      currentFormIndex.value++;
    }
  }

  // Navigate to the previous step
  void goToPreviousStep() {
    if (currentFormIndex.value > 0) {
      currentFormIndex.value--;
    }
  }

  // Show popups for dropdown selection
  void showPopUpMarriage(BuildContext context) {
    showPopover(
      direction: PopoverDirection.right,
      height: marriagestatus.length * 50.0,
      width: 20.0.w,
      context: context,
      bodyBuilder: (context) {
        return ListView.builder(
          itemCount: marriagestatus.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                selectedMarriage.value = marriagestatus[index];
                Navigator.pop(context);
              },
              title: Text(marriagestatus[index]),
            );
          },
        );
      },
    );
  }

  void showPopUpGender(BuildContext context) {
    showPopover(
      direction: PopoverDirection.right,
      height: gender.length * 50.0,
      width: 25.0.w,
      context: context,
      bodyBuilder: (context) {
        return ListView.builder(
          itemCount: gender.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                selectedGender.value = gender[index];
                Navigator.pop(context);
              },
              title: Text(gender[index]),
            );
          },
        );
      },
    );
  }

  void showPopUp(BuildContext context) {
    showPopover(
      direction: PopoverDirection.right,
      height: 17.0.h,
      width: 20.0.w,
      context: context,
      bodyBuilder: (context) {
        return ListView.builder(
          itemCount: bloodGroups.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                selectedBloodGroup.value = bloodGroups[index];
                Navigator.pop(context);
              },
              title: Text(bloodGroups[index]),
            );
          },
        );
      },
    );
  }

  // Function to show validation errors
  void showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: Text("Validation Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
    );
  }

  // Validation Of First Page
  bool validateForm() {
    // Validate Name
    if (nameController.text.trim().isEmpty) {
      showErrorDialog("Name cannot be empty");
      return false;
    }

    // Validate Birthdate
    if (formattedDate.value.isEmpty) {
      showErrorDialog("Birthdate cannot be empty");
      return false;
    }

    // Validate File (Photo Upload)
    if (selectedFileName.value.isEmpty) {
      showErrorDialog("Please upload a photo");
      return false;
    }

    // Validate Gender
    if (selectedGender.value.isEmpty) {
      showErrorDialog("Gender cannot be empty");
      return false;
    }

    // Validate Address
    if (addressController.text.trim().isEmpty) {
      showErrorDialog("Address cannot be empty");
      return false;
    }

    // Validate Phone Number
    String phoneNumber = phoneController.text.trim();
    RegExp regExp = RegExp(r'^[0-9]+$');
    int phoneLength = phoneNumber.length;

    if (!regExp.hasMatch(phoneNumber) || phoneLength != 10) {
      showErrorDialog("Phone number must be a valid 10-digit number");
      return false;
    }

    // Validate Email
    if (emailIDController.text.trim().isEmpty ||
        !GetUtils.isEmail(emailIDController.text.trim())) {
      showErrorDialog("Please enter a valid email address");
      return false;
    }

    return true;
  }

  // Validation Of Second Page

  bool validateForm2() {
    // Validate Name
    if (castController.text.trim().isEmpty) {
      showErrorDialog("Caste cannot be empty");
      return false;
    }

    if (subCastController.text.trim().isEmpty) {
      showErrorDialog("Sub-caste cannot be empty");
      return false;
    }

    if (rasController.text.trim().isEmpty) {
      showErrorDialog("Ras cannot be empty");
      return false;
    }

    if (ganController.text.trim().isEmpty) {
      showErrorDialog("Gan cannot be empty");
      return false;
    }
    if (devakController.text.trim().isEmpty) {
      showErrorDialog("Devak cannot be empty");
      return false;
    }

    if (selectedBloodGroup.value.isEmpty) {
      showErrorDialog("Demand details cannot be empty");
      return false;
    }

    if (demandController.text.trim().isEmpty) {
      showErrorDialog("Demand details cannot be empty");
      return false;
    }

    return true;
  }

  // Validation Of Third Page

  bool validateForm3() {
    // Validate Name
    if (educationController.text.trim().isEmpty) {
      showErrorDialog("Education cannot be empty");
      return false;
    }

    if (jobController.text.trim().isEmpty) {
      showErrorDialog("Job cannot be empty");
      return false;
    }

    return true;
  }









  // File picker and image handling
  Future<void> pickFile(FileType fileType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: false,
      );

      if (result != null) {
        selectedFile.value = result.files.first;
        selectedFileName.value = selectedFile.value!.name;
        if (fileType == FileType.image) {
          Uint8List? fileBytes;
          if (selectedFile.value!.bytes != null) {
            fileBytes = selectedFile.value!.bytes;
          } else if (selectedFile.value!.path != null) {
            File file = File(selectedFile.value!.path!);
            fileBytes = await file.readAsBytes();
          }
          if (fileBytes != null) {
            String base64String = base64Encode(fileBytes);
            selectedFileUnicode.value = base64String;
          } else {
            selectedFileUnicode.value = '';
          }
        } else {
          selectedFileUnicode.value = '';
        }
      } else {
        print('File selection canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  // Date picker
  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      formattedDate.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      print('Selected date: ${formattedDate.value}');
    } else {
      print('Date selection canceled.');
    }
  }

  Future<bool> submitFormData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String token = sharedPreferences.getString('token') ?? "";

    // Create the request model
    final ClientRegistrationModel request = ClientRegistrationModel(
      id: "1",
      userName: nameController.text.trim(),
      cast: castController.text.trim(),
      subCast: subCastController.text.trim(),
      devak: devakController.text.trim(),
      ras: rasController.text.trim(),
      gan: ganController.text.trim(),
      address: addressController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      email: emailIDController.text.trim(),
      education: educationController.text.trim(),
      job: jobController.text.trim(),
      demands: demandController.text.trim(),
      bloodGroup: selectedBloodGroup.value.trim(),
      gender: selectedGender.value.trim(),
      marragestatus: selectedMarriage.value.trim(),
      profilePictureUrl: selectedFileUnicode.value,
      birthDate: formattedDate.value.trim(),
    );

    // Send the request
    try {
      final response = await http.post(
        Uri.parse(baseUrl + newRegistration),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(request.toJson()),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonDecode(response.body)['message']);

        Get.to(() => Dashboard());
        return true;
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
        return false;
      }
    } catch (e) {
      print("Network Error: $e");
      return false;
    }
  }
}
