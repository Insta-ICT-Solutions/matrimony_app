// import 'dart:ui';
//
// import 'package:bright_weddings/View/pop_up_Screen/button.dart';
// import 'package:bright_weddings/View/welcome_page/viwes/second_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void _showLoginPopup(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         backgroundColor: Colors.transparent, // Transparent background
//         insetPadding: EdgeInsets.all(0), // Remove default padding around the dialog
//         child: Center(
//           child: Stack(
//             children: [
//               // Apply blur effect to the background
//               Positioned.fill(
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                   child: Container(
//                     color: Colors.black.withOpacity(0.3),
//                   ),
//                 ),
//               ),
//               // The actual popup dialog
//               Container(
//                 width: 500,
//                 height: 700,
//                 padding: EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: PopUpButton(), // Your existing registration form
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
