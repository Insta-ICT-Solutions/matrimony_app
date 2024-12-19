import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/success_story/success_story.dart';
import 'package:bright_weddings/Controller/SuccessStory_Controllar.dart';
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ListSuccessStory.dart';
import 'Success_Page_Mobile.dart';

class AddSuccessStoryMobile extends StatelessWidget {
  AddSuccessStoryMobile({super.key});

  final ProfileController controller = Get.find<ProfileController>();
  final SuccessStoryController successController = Get.put(SuccessStoryController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5.w), // Padding adjusted for responsiveness
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar with responsiveness
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.8, // 80% of the screen width
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: controller.searchController,
                          onChanged: (value) {
                            controller.filterSearch(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffbfc7e8),
                            focusColor: Colors.transparent,
                            hintText: 'Search Here ...',
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
                  SizedBox(width: width * 0.05),
                ],
              ),
              SizedBox(height: height * 0.03), // Spacing between the search and list

              // ListSuccessStory widget (already implemented)
              Center(
                child: Container(
                  width: width * 0.7, // 70% of the screen width
                  height: height * 0.5, // 50% of the screen height
                  child: ListSuccessStory(),
                ),
              ),

              SizedBox(height: height * 0.03), // Spacing between the list and containers

              // Two user profile containers with responsiveness
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() {
                    final user1 = controller.selectedUser1;
                    return Container(
                      width: width * 0.4, // 40% of the screen width
                      height: height * 0.2, // 20% of the screen height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Stack(
                        children: [
                          user1.isNotEmpty
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  user1["image_url"]!,
                                  width: width * 0.4, // 40% width
                                  height: height * 0.15, // 15% height
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                user1["full_name"]!,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                              : Center(child: Text("No User Selected")),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                controller.clearSelectedUser3();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    final user2 = controller.selectedUser2;
                    return Container(
                      width: width * 0.4, // 40% of the screen width
                      height: height * 0.2, // 20% of the screen height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Stack(
                        children: [
                          user2.isNotEmpty
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  user2["image_url"]!,
                                  width: width * 0.4, // 40% width
                                  height: height * 0.15, // 15% height
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                user2["full_name"]!,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                              : Center(child: Text("No User Selected")),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                controller.clearSelectedUser4();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),

              SizedBox(height: height * 0.02), // Spacing between the users and button

              // Add Success Stories button with responsiveness
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    successController.addSuccessStory(
                        controller.selectedUser1["full_name"] ?? "Name 1 NA",
                        controller.selectedUser2["full_name"] ?? "Name 2 NA",
                        controller.selectedUser1["image_url"] ?? "Link 1 NA",
                        controller.selectedUser2["image_url"] ?? "Link 2 NA");
                    Get.to(() => SuccessMobile());
                    Get.snackbar(
                      "Success",
                      "Success story added!${controller.selectedUser1["full_name"]}",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.1, vertical: height * 0.02), // Responsive padding
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Add Success Stories',
                    style: TextStyle(
                      fontSize: width * 0.04, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
