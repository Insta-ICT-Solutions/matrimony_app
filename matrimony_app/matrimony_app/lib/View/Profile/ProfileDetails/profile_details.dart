// import 'package:flutter/material.dart';
// import 'package:bright_weddings/Component/AppBar/header.dart';
// import 'package:bright_weddings/Component/footer.dart';
// import 'package:bright_weddings/Helper/size_config.dart';
//
// import '../../../Component/Dashboard/image_card.dart';
// import '../../../Component/Dashboard/profile_list/Profile_Screens.dart';
// import '../../../Component/EditProfileComponent/bottom_sheet_widget.dart';
//
// class ProfileHistory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: Header(),
//         body: Padding(
//             padding:  EdgeInsets.all(3.h),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 30.0.h,
//                           width: double.infinity,
//                           child: ImageCard(
//                             imageUrl: 'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
//                             borderRadius: BorderRadius.zero,
//                           ),
//                         ),
//                         //SizedBox(height: 2.0.h),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: Text('CHAT NOW'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   //padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 10.0.w),
//                                   textStyle: TextStyle(
//                                     fontSize: 1.4.t,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.zero,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: ElevatedButton.icon(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return ShareProfileBottomSheet(
//                                       );
//                                     },
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(25.0),
//                                       ),
//                                     ),
//                                     backgroundColor: Colors.transparent,
//                                   );
//                                 },
//                                 icon: Icon(Icons.share, color: Colors.white),
//                                 label: Text('Share Profile',
//                                     style: TextStyle(color: Colors.white)),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.orangeAccent,
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 2.0.h, horizontal: 12.5.w),
//                                   shape: RoundedRectangleBorder(),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(width: 5.w,),
//                 Expanded(child: ProfileDetails())
//               ],
//             ),
//             ),
//         );
//     }
// }