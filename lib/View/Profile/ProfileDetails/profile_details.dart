import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import '../../../Component/Dashboard/image_card.dart';
import '../../../Component/EditProfileComponent/bottom_sheet_widget.dart';
import '../../../Component/profile_details_component.dart';

class ProfileDetails extends StatelessWidget {
  final Map<String, dynamic> user;

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
                        Expanded(
                          child: ImageCard(
                            imageUrl: user['image_url'],
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
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
                                icon: Icon(Icons.chat, color: Colors.white),
                                label: Text('CHAT NOW',
                                    style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.h),
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
                                      vertical: 2.0.h, ),
                                  shape: RoundedRectangleBorder(),
                                ),
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
                      child: ProfileDetailsComponent(user: user),
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
