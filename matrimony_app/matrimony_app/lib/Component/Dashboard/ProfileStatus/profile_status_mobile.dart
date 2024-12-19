import 'package:bright_weddings/Component/Dashboard/image_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../View/Profile/EditProfile/edit_profile.dart';
import '../../../View/Profile/EditProfile/edit_profile_mobile.dart';

class ProfileStatusMobile extends StatelessWidget {
  const ProfileStatusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(deviceHeight * 0.02), // 2% of screen height for padding
      height: deviceHeight * 0.3, // 30% of screen height
      width: deviceWidth * 0.85, // 85% of screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(deviceWidth * 0.025), // 2.5% of width for rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: deviceWidth * 0.02, // Adjust shadow blur radius
          ),
        ],
      ),
      child: Stack(
        children: [
          // Image
          ImageCard(
            imageUrl:
            'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
          ),
          // Edit Profile Button
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                Get.to(() => EditProfileMobile());
              },
              child: Container(
                height: deviceHeight * 0.05, // 5% of screen height
                width: deviceWidth * 0.77, // 77% of screen width
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: deviceWidth * 0.04, // 4% of screen width
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
