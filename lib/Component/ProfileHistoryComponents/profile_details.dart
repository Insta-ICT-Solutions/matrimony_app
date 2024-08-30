import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Anjelina Jolie',
            style: TextStyle(
              fontSize: 2.0.t,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.0.h),
          Chip(
            label: Text(
              'Profile History',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightGreen,
          ),
          SizedBox(height: 2.0.h),

          // The Row containing the info tiles
          Row(
            children: [
              Expanded(
                child: _buildInfoTile('CITY', 'New York', Icons.location_city,Colors.purple,),
              ),
              Expanded(
                child: _buildInfoTile('AGE', '25', Icons.calendar_month_outlined, Colors.pink,),
              ),
              Expanded(
                child: _buildInfoTile('HEIGHT', '5.7', Icons.height, Colors.orange,),
              ),
              Expanded(
                child: _buildInfoTile('JOB', 'Engineer', Icons.work, Colors.green,),
              ),
            ],
          ),

          SizedBox(height: 4.0.h),
          Text(
            'ABOUT',
            style: TextStyle(
              fontSize: 1.5.t,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.0.h),
          Text(
            'Looking for well settled guy.',
            style: TextStyle(fontSize: 1.2.t),
          ),
          SizedBox(height: 2.0.h),
          Text(
            'CONTACT INFO',
            style: TextStyle(
              fontSize: 1.5.t,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          _buildContactInfoTile(Icons.mobile_friendly, 'Phone', '+91 1234567897', Colors.green,),
          _buildContactInfoTile(Icons.email, 'Email', 'email@gmail.com', Colors.red,),
          _buildContactInfoTile(Icons.home, 'Address', '28800 Orchard Lake Road', Colors.blue,),
          SizedBox(height: 2.0.h),
          Text(
            'PERSONAL INFORMATION',
            style: TextStyle(
              fontSize: 1.5.t,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          _buildPersonalInfoTile('Name', 'Angelina Jolie'),
          _buildPersonalInfoTile('Family', 'Joint Family'),
          _buildPersonalInfoTile('Father\'s Name', 'John'),
          _buildPersonalInfoTile('Age', '25'),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value, IconData icon, Color iconColor) {
    return Container(     //remove AspectRatio
      //aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.all(2.0.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 4.0.w, color: iconColor),
            SizedBox(height: 0.5.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 1.0.t,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 0.3.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 1.3.t,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoTile(IconData icon, String type, String info, Color iconColor) {
    return Row(
      children: [
        Icon(icon, size: 4.0.w, color: iconColor),
        SizedBox(width: 2.0.w),
        Expanded(
          child: Text(
            '$type: $info',
            style: TextStyle(fontSize: 1.2.t),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoTile(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '> $label: $value',
            style: TextStyle(fontSize: 1.0.t),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
