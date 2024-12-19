import 'package:bright_weddings/Component/Dashboard/image_card.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/ProfileDetails.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Helper/size_config.dart';

import '../../../View/Profile/EditProfile/edit_profile.dart';
import '../../EditProfileComponent/bottom_sheet_widget.dart';

class ProfileHistoryPage extends StatelessWidget {
  final Map<String, dynamic> user;
  const ProfileHistoryPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(3.h),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                  height: 30.0.h,
                  width: double.infinity,
                  child: ImageCard(
                    imageUrl: user['image_url'],
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                //SizedBox(height: 2.0.h),
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
                        label: Text('Edit Profile',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[500],
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.h, horizontal: 12.5.w),
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ),
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
                        label: Text('Share Profile',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.h, horizontal: 12.5.w),
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            SizedBox(
              width: 5.w,
            ),
            Expanded(child: ProfileDetails(user: user))
          ],
        ),
      ),
    );
  }
}
