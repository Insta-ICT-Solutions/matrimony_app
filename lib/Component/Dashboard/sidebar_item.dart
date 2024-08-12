import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/colors.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String? leadingPath;
  final VoidCallback onTap;
  
  const SidebarItem({super.key, required this.title, required this.isSelected, this.leadingPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSelected ? Container(margin: EdgeInsets.only(right: 0.8.w),height: 1.8.h,width: 5, color: dashboardSelectedColor,) : Container(margin: EdgeInsets.only(right: 0.8.w),height: 1.5.h,width: 5),
        Container(
          alignment: Alignment.center,
          height: 3.0.h,
          width: 33.0.w,
          decoration: BoxDecoration(
              gradient: isSelected ?LinearGradient(colors: [
                dashboardSelectedOneColor,
                dashboardSelectedTwoColor
              ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
              ) : null
          ),
          child: ListTile(
            leading: leadingPath!=null ? SvgPicture.asset(leadingPath!) : null,
            isThreeLine: false,
            onTap: onTap,
            title: Text(title, style: GoogleFonts.poppins(fontSize: 1.0.t, color: isSelected ? dashboardSelectedColor : Colors.black),),
          ),
        ),
      ],
    );
  }
}
