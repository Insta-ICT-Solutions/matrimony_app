//
// import 'package:flutter/material.dart';
// import 'package:bright_weddings/Helper/size_config.dart';
//
// class ProfileDetails extends StatelessWidget {
//   final Map<String, dynamic> user;
//   const ProfileDetails({super.key, required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Color(0xFFE5E5F3),],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.0.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               // Profile Name
//               Center(
//                 child: Text(
//                   user['full_name'],
//                   style: TextStyle(
//                     fontSize: 2.6.t,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 1.5.h),
//               // Info Tiles in two rows for better balance
//               _buildInfoCards(),
//               SizedBox(height: 2.0.h),
//
//               // Personal Information
//               _buildSectionTitle('Personal Information'),
//               _buildBulletPoint('Cast: ${user['cast']}'),
//               _buildBulletPoint('Sub Cast: ${user['sub_cast']}'),
//               _buildBulletPoint('Devak: ${user['devak']}'),
//               _buildBulletPoint('Ras: ${user['ras']}'),
//               _buildBulletPoint('Gan: ${user['gan']}'),
//               _buildBulletPoint('Education: ${user['education']}'),
//               _buildBulletPoint('Demands: ${user['demands']}'),
//               SizedBox(height: 2.0.h),
//
//               // About Section
//               _buildSectionTitle('About'),
//               Text(
//                 user['about'],
//                 style: TextStyle(fontSize: 1.4.t, color: Colors.grey.shade800),
//               ),
//               SizedBox(height: 2.0.h),
//
//               // Contact Info
//               _buildSectionTitle('Contact Info'),
//               _buildBulletPoint('Phone: ${user['phone_number']}'),
//               _buildBulletPoint('Email: ${user['email']}'),
//               _buildBulletPoint('Address: ${user['address']}'),
//               SizedBox(height: 2.0.h),
//
//               // Family Information
//               _buildSectionTitle('Family Information'),
//               _buildBulletPoint('Father\'s Name: ${user['fathers_name']}'),
//               _buildBulletPoint('Mother\'s Name: ${user['mothers_name']}'),
//               _buildBulletPoint('Family Type: ${user['family_type']}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Section title widget
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 1.5.h),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 2.0.t,
//           fontWeight: FontWeight.bold,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
//
//   // Info Cards for main details
//   Widget _buildInfoCards() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildInfoTile('City', user['address'], Icons.location_city, Colors.purple),
//         _buildInfoTile('Age', user['age'], Icons.calendar_today_outlined, Colors.pink),
//         _buildInfoTile('Height', user['height'], Icons.height, Colors.orange),
//         _buildInfoTile('Job', user['job'], Icons.work_outline, Colors.green),
//       ],
//     );
//   }
//
//   // Info Tile for each row
//   Widget _buildInfoTile(String label, String value, IconData icon, Color iconColor) {
//     return Container(
//       padding: EdgeInsets.all(2.0.w),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color(0xFFffffff)),
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xFFE5E5F3),
//             blurRadius: 8,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundColor: iconColor.withOpacity(0.2),
//             radius: 4.5.w,
//             child: Icon(icon, size: 4.0.w, color: iconColor),
//           ),
//           SizedBox(height: 0.5.h),
//           Text(
//             label,
//             style: TextStyle(fontSize: 1.0.t, color: Colors.grey.shade600),
//           ),
//           SizedBox(height: 0.3.h),
//           Text(
//             value,
//             style: TextStyle(fontSize: 1.4.t, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Bullet Point Styled text for Info
//   Widget _buildBulletPoint(String text) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 0.5.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('• ', style: TextStyle(fontSize: 1.5.t, fontWeight: FontWeight.bold)),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 1.4.t, color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';

class ProfileDetails extends StatelessWidget {
  final Map<String, dynamic> user;
  const ProfileDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xffe0e0ef)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image and Name
              Center(
                child: Column(
                  children: [
                    Text(
                      user['full_name'] ?? 'No Name Provided',
                      style: TextStyle(
                        fontSize: 2.6.t,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.0.h),

              // Info Tiles
              Center(child: _buildInfoCards()),
              SizedBox(height: 1.5.h),
              // Personal Information
              _buildEnhancedCard(
                title: 'Personal Information',
                icon: Icons.person_outline,
                iconColor: Colors.blue,
                children: [
                  _buildBulletPoint('Cast: ${user['cast'] ?? 'N/A'}'),
                  _buildBulletPoint('Sub Cast: ${user['sub_cast'] ?? 'N/A'}'),
                  _buildBulletPoint('Devak: ${user['devak'] ?? 'N/A'}'),
                  _buildBulletPoint('Ras: ${user['ras'] ?? 'N/A'}'),
                  _buildBulletPoint('Gan: ${user['gan'] ?? 'N/A'}'),
                  _buildBulletPoint('Education: ${user['education'] ?? 'N/A'}'),
                  _buildBulletPoint('Demands: ${user['demands'] ?? 'N/A'}'),
                  _buildBulletPoint('About: ${user['about'] ?? 'N/A'}'),

                ],
              ),
              SizedBox(height: 0.2.h),



              // Contact Info
              _buildEnhancedCard(
                title: 'Contact Info',
                icon: Icons.contact_phone_outlined,
                iconColor: Colors.teal,
                children: [
                  _buildBulletPoint('Phone: ${user['phone_number'] ?? 'N/A'}'),
                  _buildBulletPoint('Email: ${user['email'] ?? 'N/A'}'),
                  _buildBulletPoint('Address: ${user['address'] ?? 'N/A'}'),
                ],
              ),
              SizedBox(height: 0.2.h),

              // Family Information
              _buildEnhancedCard(
                title: 'Family Information',
                icon: Icons.family_restroom_outlined,
                iconColor: Colors.purple,
                children: [
                  _buildBulletPoint('Father\'s Name: ${user['fathers_name'] ?? 'N/A'}'),
                  _buildBulletPoint('Mother\'s Name: ${user['mothers_name'] ?? 'N/A'}'),
                  _buildBulletPoint('Family Type: ${user['family_type'] ?? 'N/A'}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedCard({required String title, required IconData icon, required Color iconColor, required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.all(2.5.w),
      margin: EdgeInsets.only(bottom: 2.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 4.0.w,
                backgroundColor: iconColor.withOpacity(0.2),
                child: Icon(icon, size: 4.0.w, color: iconColor),
              ),
              SizedBox(width: 2.0.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 2.0.t,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.all(2.0.w),
      margin: EdgeInsets.only(bottom: 2.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.0.h),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 2.0.t,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // _buildInfoTile('City', user['address'] ?? 'N/A', Icons.location_city, Colors.purple),
          _buildInfoTile('Age', user['age'] ?? 'N/A', Icons.calendar_today_outlined, Colors.pink),
          _buildInfoTile('Height', user['height'] ?? 'N/A', Icons.height, Colors.orange),
          _buildInfoTile('Job', user['job'] ?? 'N/A', Icons.work_outline, Colors.green),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(2.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.2),
            radius: 4.5.w,
            child: Icon(icon, size: 4.0.w, color: iconColor),
          ),
          SizedBox(height: 0.8.h),
          Text(
            label,
            style: TextStyle(fontSize: 1.2.t, color: Colors.grey.shade600),
          ),
          SizedBox(height: 0.3.h),
          Text(
            value,
            style: TextStyle(fontSize: 1.5.t, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('• ', style: TextStyle(fontSize: 1.8.t, color: Colors.black87)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 1.2.t, color: Colors.grey.shade800))),
        ],
      ),
    );
  }
}
