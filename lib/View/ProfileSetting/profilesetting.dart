import 'package:bright_weddings/Component/ProfileSettingsComponents/ProfileCard.dart';
import 'package:bright_weddings/Component/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import '../../Component/AppBar/header.dart';
import 'package:bright_weddings/Component/search_bar.dart';

class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: Header(),
      body: Row(
        children: [
          Container(
            color: Colors.white,
            child: Sidebar(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(1.8.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Profile Settings',
                          style: TextStyle(
                            fontSize: 2.0.t,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF957D61),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Search_Bar(),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0.h),
                    ProfileCard(), //
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
