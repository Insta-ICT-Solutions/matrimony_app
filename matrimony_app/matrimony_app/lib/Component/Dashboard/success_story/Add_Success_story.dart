import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/success_story/success_story.dart';
import 'package:bright_weddings/Controller/SuccessStory_Controllar.dart';
import 'package:bright_weddings/Controller/profile_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'ListSuccessStory.dart';

class AddSuccessStory extends StatelessWidget {
  AddSuccessStory({super.key});

  final ProfileController controller = Get.find<ProfileController>();
  final SuccessStoryController successController = Get.put(SuccessStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120.w,
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
                  SizedBox(width: 3.w),
                ],
              ),
              SizedBox(height: 3.h),

              // ListSuccessStory widget (already implemented)
              Center(
                child: Container(
                  width: 70.h,
                  height: 50.h, // Adjust height as needed
                  child: ListSuccessStory(),
                ),
              ),

              // Adding spacing between the list and the containers
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() {
                    final user1 = controller.selectedUser1;
                    return Container(
                      width: 40.w,
                      height: 20.h,
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
                                        width: 40.w,
                                        height: 15.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
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
                      width: 40.w,
                      height: 20.h,
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
                                        width: 40.w,
                                        height: 15.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
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

              SizedBox(height: 2.h),

              // Add Success Stories button
              Center(
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    successController.addSuccessStory(
                        controller.selectedUser1["full_name"] ?? "Name 1 NA",
                        controller.selectedUser2["full_name"] ?? "Name 2 NA",
                        controller.selectedUser1["image_url"] ?? "Link 1 NA",
                        controller.selectedUser2["image_url"] ?? "Link 2 NA");
                    Get.to(() => SuccessStory());
                    Get.snackbar(
                      "Success",
                      "Success story added!${controller.selectedUser1["full_name"]}",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Add Success Stories',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
