
import 'package:bright_weddings/Component/EditProfileComponents/bottom_sheet_widget.dart';
import 'package:bright_weddings/Component/ProfileHistoryComponents/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/image_card.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:bright_weddings/Helper/size_config.dart';

class ProfileHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                height: 30.0.h,
                                width: double.infinity,
                                child: ImageCard(
                                  imageUrl: 'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              //SizedBox(height: 2.0.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('CHAT NOW'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 10.0.w),
                                        textStyle: TextStyle(
                                          fontSize: 1.4.t,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
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
                                      child: Text('SHARE PROFILE'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 10.0.w),
                                        textStyle: TextStyle(
                                          fontSize: 1.4.t,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0.w),
                        Expanded(
                          flex: 1,
                          child: ProfileDetails(), // Use the profile_details component
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0.h),
                    Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
