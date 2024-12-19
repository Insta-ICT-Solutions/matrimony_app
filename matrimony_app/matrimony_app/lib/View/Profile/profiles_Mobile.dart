import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/profile_list.dart';
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Component/Dashboard/profile_list/profile_list_Mobile.dart';

class ProfilesMobile extends StatelessWidget {
  ProfilesMobile({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    // Retrieve device width and height for responsiveness
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(deviceWidth * 0.05), // 5% of screen width as padding
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Search Bar
                SizedBox(
                  width: deviceWidth * 0.75, // 75% of screen width for search bar
                  child: Stack(
                    children: [
                      TextFormField(
                        controller: controller.searchController,
                        onChanged: (value) {
                          controller.filterSearch(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffbfc7e8),
                          hintText: 'Search Here ...',
                          focusedBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                      // Positioned text for additional information
                      Positioned(
                        right: 10, // Adjust position dynamically based on available space
                        top: 25, // Center vertically inside the TextFormField
                        child: Text(
                          'Name, Education, Cast',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: deviceWidth * 0.02, // Responsive font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: deviceWidth * 0.03), // Responsive spacing
                // Uncomment below buttons when needed
                // Builder(builder: (buttonContext) {
                //   return Obx(() => HollowButton(
                //     title: controller.selectedFilter.value,
                //     onTap: () {
                //       controller.filterPopUp(buttonContext);
                //     },
                //     height: deviceHeight * 0.05,
                //     width: deviceWidth * 0.25,
                //   ));
                // }),
              ],
            ),
            SizedBox(height: deviceHeight * 0.02), // Spacing between search bar and list

            // Profile List Section
            Expanded(
              child: Center(
                child: Container(
                  width: deviceWidth * 0.85, // 85% of screen width
                  child: ProfileListMobile(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
