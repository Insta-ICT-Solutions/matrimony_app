import 'package:bright_weddings/Component/Dashboard/circular_bullet.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/profile_screen_Mobile.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/profile_controller.dart';
import '../../../Helper/colors.dart';
import '../../../View/Profile/ProfileDetails/profile_details.dart';
import '../image_card.dart';
import 'Profile_Screens.dart';

class ProfileListMobile extends StatelessWidget {
  ProfileListMobile({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
      itemCount: controller.filteredList.length,
      itemBuilder: (context, index) {
        final user = controller.filteredList[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h), // Responsive padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Card for user profile picture
              Container(
                width: 22.w, // Responsive width
                height: 15.h, // Proportional height for the image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageCard(imageUrl: user['image_url']),
              ),
              SizedBox(width: 4.w), // Adjust the space between the image and text

              // Expanded to ensure text column takes available space without overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name Row
                    Row(
                      children: [
                        Text(
                          user['full_name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 2.t, // Adjust font size for mobile
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h), // Spacer between rows

                    // Address, Age, Education
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w),
                        Flexible(
                          child: Text(
                            user['address'],
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t, // Adjust font size
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        CircularBullet(),
                        SizedBox(width: 0.5.w),
                        Flexible(
                          child: Text(
                            user['age'],
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t, // Adjust font size
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        CircularBullet(),
                        SizedBox(width: 0.5.w),
                        Flexible(
                          child: Text(
                            user['education'],
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t, // Adjust font size
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Demands and Cast
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w),
                        Flexible(
                          child: Text(
                            user['demands'],
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t, // Adjust font size
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w),
                        Flexible(
                          child: Text(
                            user['cast'],
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t, // Adjust font size
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h), // Spacer

                    // Buttons for viewing profile and getting matches
                    Row(
                      children: [
                        // View Full Profile Button
                        InkWell(
                          onTap: () {
                            Get.to(() => ProfileScreenMobile(user: user));
                          },
                          child: Container(
                            height: 4.h, // Adjust height for button
                            width: 18.w, // Adjust width for button
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1),
                            ),
                            child: Center(
                              child: Text(
                                'View Full Profile',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 1.t, // Adjust font size
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w), // Spacer between buttons

                        // Get Matches Button
                        InkWell(
                          onTap: () {
                            controller.getMatches(user);
                            _showMatchedUsersDialog(context);
                          },
                          child: Container(
                            height: 4.h, // Adjust height for button
                            width: 18.w, // Adjust width for button
                            decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Get matches',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 1.t, // Adjust font size
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Divider(
            color: Color(0xFFE7E7E7),
            thickness: 1,
          ),
        );
      },
    ));
  }

  void _showMatchedUsersDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text("Matched Users"),
        content: Container(
          width: 70.w,
          color: Colors.transparent,
          child: Obx(() => controller.matchedUsers.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: controller.matchedUsers.length,
            itemBuilder: (context, index) {
              final matchedUser = controller.matchedUsers[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(matchedUser['image_url']),
                ),
                title: Text(matchedUser['full_name']),
                subtitle: Text(
                    '${matchedUser['age']} years old, ${matchedUser['education']}'),
              );
            },
          )
              : Text("No matches found.")),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}
