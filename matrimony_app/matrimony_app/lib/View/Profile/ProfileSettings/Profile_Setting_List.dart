import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Component/Dashboard/image_card.dart';
import '../../../Component/Dashboard/profile_list/Profile_Screens.dart';
import '../../../Component/switch_list_tile.dart';
import '../../../Controller/profile_controller.dart';
import '../../../Helper/colors.dart';

class ProfileSettingList extends StatelessWidget {
  ProfileSettingList({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
      itemCount: controller.filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        final user = controller.filteredList[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Card background color
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4), // Shadow positioning
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18.w, // Adjusted width to make it more visible
                        height: 15.w, // Made height and width proportional
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ImageCard(imageUrl: user['image_url']),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['full_name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 1.3.t,
                                  color: textColor),
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.redAccent, size: 1.2.t),
                                SizedBox(width: 0.5.w),
                                Text(user['address'],
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: 1.1.t,
                                    )),
                              ],
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              children: [
                                Icon(Icons.cake, color: Colors.blueAccent, size: 1.2.t),
                                SizedBox(width: 0.5.w),
                                Text(user['age'],
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: 1.1.t,
                                    )),
                              ],
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              children: [
                                Icon(Icons.school, color: Colors.green, size: 1.2.t),
                                SizedBox(width: 0.5.w),
                                Text(user['education'],
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: 1.1.t,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Divider(color: Colors.grey.shade300, thickness: 1),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 4.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text('Demands:', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  //       Text(user['demands'], style: GoogleFonts.poppins(color: textColor, fontSize: 1.t)),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 4.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text('Caste:', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  //       Text(user['cast'], style: GoogleFonts.poppins(color: textColor, fontSize: 1.t)),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => ProfileHistoryPage(user: user));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrangeAccent]),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'View Full Profile',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 0.9.t),
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.more_vert, color: Colors.grey),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      children: [
                        Obx(() => CustomSwitchListTile(
                          title: 'Profile visible',
                          subtitle: 'You can set-up the visibility of profile.',
                          value: controller.isProfileVisible.value,
                          onChanged: (bool value) {
                            controller.isProfileVisible.value = value;
                          },
                        )),
                        Obx(() => CustomSwitchListTile(
                          title: 'Change Status',
                          subtitle: 'You can change the status of profile.',
                          value: controller.isStatusChangeable.value,
                          onChanged: (bool value) {
                            controller.isStatusChangeable.value = value;
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 1.h);
      },
    ));
  }
}
