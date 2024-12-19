import 'package:bright_weddings/Component/Dashboard/image_card.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/Mock%20API/user_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/profile_controller.dart';

import '../../../View/Profile/EditProfile/edit_profile.dart';

class ProfileStatus extends StatelessWidget {
   ProfileStatus({super.key});

  final ProfileController controller = Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      height: 30.0.h,
      width: 75.0.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          ListView.builder(
            itemCount: controller.filteredList.length, // Use the userList length
            itemBuilder: (context, index) {
              final user = controller.filteredList[index]; // Access each user
              return ImageCard(imageUrl: user['image_url']); // Use the correct key for the image URL
            },
          ),


          Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () {
                  Get.to(() => EditProfile());
                },
                child: Container(
                  height: 5.h,
                  width: 77.w,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.2.t),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
