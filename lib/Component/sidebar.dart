import 'package:bright_weddings/Component/image_card.dart';
import 'package:bright_weddings/Component/sidebar_item.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  final ScreenController controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.45.w,
      ),
      height: 35.0.h,
      width: 30.0.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 22.7.w,
            height: 15.0.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ImageCard(imageUrl: "https://media.istockphoto.com/id/1368965646/photo/multi-ethnic-guys-and-girls-taking-selfie-outdoors-with-backlight-happy-life-style-friendship.jpg?s=612x612&w=0&k=20&c=qYST1TAGoQGV_QnB_vMd4E8jdaQUUo95Sa2JaKSl_-4="),
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Obx(()=>SidebarItem(title: "Dashboard", isSelected: controller.selectedScreen.value == 0, onTap: ()=>controller.selectedScreen.value = 0)),
          SizedBox(
            height: 0.5.h,
          ),
          Obx(()=>SidebarItem(title: "Profiles", isSelected: controller.selectedScreen.value == 1, onTap: ()=>controller.selectedScreen.value = 1)),
          SizedBox(
            height: 0.5.h,
          ),
          Obx(()=>SidebarItem(title: "Profile list", isSelected: controller.selectedScreen.value == 2, onTap: ()=>controller.selectedScreen.value = 2)),
          SizedBox(
            height: 0.5.h,
          ),
          Obx(()=>SidebarItem(title: "Settings", isSelected: controller.selectedScreen.value == 3, onTap: ()=>controller.selectedScreen.value = 3)),
          SizedBox(
            height: 0.5.h,
          ),
          Obx(()=>SidebarItem(title: "Log out", isSelected: controller.selectedScreen.value == 4, onTap: ()=>controller.selectedScreen.value = 4)),
          SizedBox(
            height: 0.5.h,
          ),
        ],
      ),
    );
  }
}
