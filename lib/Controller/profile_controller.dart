import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  var selectedFile = Rxn<PlatformFile>();
  var selectedFileName = "Update from Device".obs;
  var selectedFileUnicode = ''.obs;
  var birthDate = 'Select Birth Date'.obs;



  final ImagePicker _picker = ImagePicker();


  // Existing method for picking files
  Future<void> pickFile(FileType fileType, bool allowMultiple) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: allowMultiple,
      );

      if (result != null) {
        selectedFile.value = result.files.first;
        selectedFileName.value = selectedFile.value!.name;
      } else {
        print('File selection canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  // controller for bottom sheet

  void showBottom(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[200]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 6,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Text(
                'Update Profile Picture',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),

              //for update from camera

              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent.withOpacity(0.2),
                  ),
                  child: Icon(Icons.camera_alt, color: Colors.blueAccent),
                ),
                title: Text('Update from Camera'),  // Option to update from the camera
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // for update from device
              Obx(() => ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent.withOpacity(0.2),
                  ),
                  child: Icon(Icons.photo_library, color: Colors.orangeAccent),
                ),
                title: Text(selectedFileName.value),
                onTap: () {
                  pickFile(FileType.image, false);
                  Navigator.pop(context);
                },
              )
              ),
            ],
          ),
        ); // Show bottom sheet with options
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  //controller for the pickDate

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      birthDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

}

      




