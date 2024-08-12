import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/sidebar.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/footer.dart';

class PagerWeb extends StatelessWidget {
  PagerWeb({super.key});

  final ScreenController controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: Header(),
      body: ListView(
        padding: const EdgeInsets.all(40.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sidebar(),
              SizedBox(width: 5.w),
              Expanded(
                child: Obx(()=>controller.screens[controller.selectedScreen.value]),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Footer(),
        ],
      ),
    );
  }
}
