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
      height: 40.0.h,
      width: 40.0.w,
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
            margin: EdgeInsets.all(20),
            width: 35.w,
            height: 12.0.h,
            child: ImageCard(imageUrl: 'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',)
          ),
          SizedBox(
            height: 1.5.h,
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
