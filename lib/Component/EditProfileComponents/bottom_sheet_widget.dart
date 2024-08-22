import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/profile_controller.dart'; // Adjust path if necessary

class BottomSheetWidget extends StatelessWidget {
  final ProfileController controller;

  BottomSheetWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
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

          // For update from camera
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.2),
              ),
              child: Icon(Icons.camera_alt, color: Colors.blueAccent),
            ),
            title: Text('Update from Camera'),
            onTap: () {
              Navigator.pop(context);
              // Implement camera functionality here
            },
          ),

          // For update from device
          Obx(() => ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent.withOpacity(0.2),
              ),
              child: Icon(Icons.photo_library, color: Colors.orangeAccent),
            ),
            title: Text(controller.selectedFileName.value.isEmpty
                ? 'Update from Gallery'
                : controller.selectedFileName.value),
            onTap: () {
              controller.pickFile(FileType.image, false);
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
