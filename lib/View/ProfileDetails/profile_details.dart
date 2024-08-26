import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import '../../Component/Dashboard/image_card.dart';
import '../../Component/bottom_sheet_widget.dart';
import '../../Component/profile_details_component.dart';
import '../../Controller/profile_controller.dart';

class ProfileDetails extends StatelessWidget {
  final Map<String, dynamic> user;

  // Constructor to accept the user data from the previous screen
  ProfileDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      children: [
                        Container(
                          height: 30.0.h,
                          width: 100.0.w,
                          child: ImageCard(
                            imageUrl: user['image_url'], // Fetch the image dynamically
                            borderRadius: BorderRadius.zero,
                          ),
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
                              icon: Icon(Icons.chat, color: Colors.white),
                              label: Text('CHAT NOW',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0.h, horizontal: 15.0.w),
                                shape: RoundedRectangleBorder(),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.share, color: Colors.white),
                              label: Text('Share Profile',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0.h, horizontal: 17.7.w),
                                shape: RoundedRectangleBorder(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ProfileDetailsComponent(user: user), // Pass the user data
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
