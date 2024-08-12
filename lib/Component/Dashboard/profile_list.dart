import 'package:bright_weddings/Component/Dashboard/circular_bullet.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/colors.dart';
import '../../Mock API/user_list.dart';
import 'image_card.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(8.w),
      height: 50.h,
      width: 133.0.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: ListView.separated(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 20.w, // Adjusted width to make it more visible
                  height: 17.w, // Made height and width proportional
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageCard(
                      imageUrl: user['image_url']), // Corrected the usage
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user['full_name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 1.1.t,
                              color: textColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['address'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t,
                            )),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['age'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t,
                            )),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['education'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['demands'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.t,
                            )),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 2.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(width: 1)
                            ),
                            child: Center(
                              child: Text('View Full Profile',style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 0.9.t
                              ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0.h,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 2.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text('Get matches',style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 0.9.t
                              ),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },

        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Divider(
              color: Color(0xFFE7E7E7),
              thickness: 1,
            ),
          );
        },
      ),
    );
  }
}
