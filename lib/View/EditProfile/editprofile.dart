import 'package:bright_weddings/Component/EditProfileComponents/edit_profile_form.dart';
import 'package:bright_weddings/Component/EditProfileComponents/bottom_sheet_widget.dart'; // Import the updated bottom sheet component
import 'package:bright_weddings/Component/image_card.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../Component/AppBar/header.dart';
import '../../Component/footer.dart';
import '../../Controller/profile_controller.dart';

class ProfileEditPage extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 25.0.h,
                            width: 90.0.w,
                            child: ImageCard(
                              imageUrl:
                              'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
                              borderRadius: BorderRadius.zero,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetWidget(
                                    controller: ProfileController(),
                                  );
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
                            label: Text('Update Profile Picture',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 10.0.w),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                          //SizedBox(width: 8.0.w),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.share, color: Colors.white),
                            label: Text('Share Profile',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 12.5.w),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4.0.h),
              EditProfileForm(),
              SizedBox(height: 10.0.h),

              // Footer Section
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
