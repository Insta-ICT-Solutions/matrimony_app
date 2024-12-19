import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Component/AppBar/header.dart';
import '../../../Component/Dashboard/image_card.dart';
import '../../../Component/EditProfileComponent/bottom_sheet_widget.dart';
import '../../../Component/EditProfileComponent/edit_profile_form.dart';
import '../../../Component/EditProfileComponent/edit_profile_form_mobile.dart';
import '../../../Component/footer.dart';
import '../../../Controller/profile_controller.dart';

class EditProfileMobile extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsive design
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: deviceHeight * 0.03), // 3% of screen height
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: deviceWidth * 0.8, // 80% of screen width
                  child: Column(
                    children: [
                      // Profile Image with Update Button
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: deviceHeight * 0.25, // 25% of screen height
                            width: deviceWidth * 0.9, // 90% of screen width
                            child: ImageCard(
                              imageUrl:
                              'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.02), // 2% of screen height
                      // Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Update Profile Picture Button
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetWidget();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              );
                            },
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            label: Text(
                              'Update Profile Picture',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.015, // 1.5% of screen height
                                horizontal: deviceWidth * 0.01, // 5% of screen width
                              ),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                          SizedBox(width: deviceWidth * 0.02), // 2% of screen width
                          // Share Profile Button
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return ShareProfileBottomSheet();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              );
                            },
                            icon: Icon(Icons.share, color: Colors.white),
                            label: Text(
                              'Share Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.015, // 1.5% of screen height
                                horizontal: deviceWidth * 0.01, // 5% of screen width
                              ),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: deviceHeight * 0.04), // 4% of screen height
              // Edit Profile Form
              EditProfileFormMobile(),
              SizedBox(height: deviceHeight * 0.06), // 6% of screen height
              // Footer Section
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
