
import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoTile('CITY', 'New York', Icons.location_city, Colors.purple),
            _buildInfoTile('AGE', '25', Icons.cake, Colors.pink),
            _buildInfoTile('HEIGHT', '5.7', Icons.height, Colors.orange),
            _buildInfoTile('JOB', 'Engineer', Icons.work, Colors.green),
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
          'It is a long established fact that a reader will be distracted by the readable \ncontent of a page when looking at its layout.',
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
        _buildContactInfoTile(Icons.phone, 'Phone', '+91 1234567897', Colors.green),
        _buildContactInfoTile(Icons.email, 'Email', 'email@gmail.com', Colors.red),
        _buildContactInfoTile(Icons.home, 'Address', '28800 Orchard Lake Road', Colors.blue),
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
    );
  }

  Widget _buildInfoTile(String label, String value, IconData icon, Color iconColor) {
    return Container(
      width: 20.w,
      height: 10.h,
      padding: EdgeInsets.all(2.0.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 4.0.w, color: iconColor),
          SizedBox(height: 1.0.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 1.0.t,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 1.3.t,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoTile(IconData icon, String type, String info, Color iconColor) {
    return Row(
      children: [
        Icon(icon, size: 4.0.w, color: iconColor),
        SizedBox(width: 2.0.w),
        Text(
          '$type: $info',
          style: TextStyle(fontSize: 1.2.t),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoTile(String label, String value) {
    return Text(
      '> $label: $value',
      style: TextStyle(fontSize: 1.0.t),
    );
  }
}
