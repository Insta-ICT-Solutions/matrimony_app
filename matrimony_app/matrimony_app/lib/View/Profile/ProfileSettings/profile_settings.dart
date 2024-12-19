// import 'package:bright_weddings/Component/Dashboard/circular_bullet.dart';
// import 'package:bright_weddings/Helper/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../Component/Dashboard/image_card.dart';
// import '../../../Controller/profile_controller.dart';
// import '../../../Helper/colors.dart';
// import '../../../View/Profile/ProfileDetails/profile_details.dart';
//
// class ProfileSettingsPage extends StatelessWidget {
//   ProfileSettingsPage({super.key});
//
//   final ProfileController controller = Get.find<ProfileController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(6.h),
//       child: Obx(() => ListView.separated(
//             itemCount: controller.filteredList.length,
//             itemBuilder: (BuildContext context, int index) {
//               final user = controller.filteredList[index];
//               return Row(
//                 children: [
//                   Container(
//                     width: 20.w, // Adjusted width to make it more visible
//                     height: 17.w, // Made height and width proportional
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: ImageCard(imageUrl: user['image_url']),
//                   ),
//                   SizedBox(width: 5.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             user['full_name'],
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 1.1.t,
//                                 color: textColor),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           CircularBullet(),
//                           SizedBox(
//                             width: 0.5.w,
//                           ),
//                           Text(user['address'],
//                               style: GoogleFonts.poppins(
//                                 color: textColor,
//                                 fontSize: 1.t,
//                               )),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 2.h,
//                       ),
//                     ],
//                   ),
//                                   ],
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.only(right: 10.0, left: 10.0),
//                 child: Divider(
//                   color: Color(0xFFE7E7E7),
//                   thickness: 1,
//                 ),
//               );
//             },
//           )),
//     );
//   }
// }

import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/profile_list.dart';
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Profile/ProfileSettings/Profile_Setting_List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsPage({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.w,
                  child:Stack(
                    children: [
                      TextFormField(
                        controller: controller.searchController,
                        onChanged: (value) {
                          controller.filterSearch(value); // This now handles both name and education
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffbfc7e8),
                          focusColor: Colors.transparent,
                          hintText: 'Search Here ...', // This is now for both
                          focusedBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(width: 3.w),

              ],
            ),
            SizedBox(height: 3.h),

            Expanded(
              child: Center(
                child: Container(
                  width: 130.w,
                  child: ProfileSettingList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

