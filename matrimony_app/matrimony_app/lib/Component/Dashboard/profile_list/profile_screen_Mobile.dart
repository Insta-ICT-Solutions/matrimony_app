import 'package:bright_weddings/Component/Dashboard/image_card.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/ProfileDetails.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';

import '../../../View/Profile/EditProfile/edit_profile.dart';
import '../../EditProfileComponent/bottom_sheet_widget.dart';

class ProfileScreenMobile extends StatelessWidget {
  final Map<String, dynamic> user;
  const ProfileScreenMobile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(deviceHeight * 0.03), // 3% of screen height for padding
        child: Column(
          children: [
            // Top section with image and buttons
            Expanded(
              child: Column(
                children: [
                  // Image section
                  Container(
                    height: deviceHeight * 0.3, // 30% of screen height
                    width: double.infinity,
                    child: ImageCard(
                      imageUrl: user['image_url'],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.02), // Spacing between image and buttons
                  // Buttons row
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return EditProfile();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                            );
                          },
                          icon: Icon(Icons.edit, color: Colors.white),
                          label: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceWidth * 0.04, // Responsive font size
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[500],
                            padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.02, // 2% of screen height
                              horizontal: deviceWidth * 0.05, // 5% of screen width
                            ),
                            shape: RoundedRectangleBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: deviceWidth * 0.03), // Spacing between buttons
                      Expanded(
                        child: ElevatedButton.icon(
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceWidth * 0.04, // Responsive font size
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.02, // 2% of screen height
                              horizontal: deviceWidth * 0.05, // 5% of screen width
                            ),
                            shape: RoundedRectangleBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: deviceHeight * 0.03), // Spacing between top and details section
            // Profile Details Section
            Expanded(
              flex: 1,
              child: ProfileDetails(user: user),
            ),
          ],
        ),
      ),
    );
  }
}
