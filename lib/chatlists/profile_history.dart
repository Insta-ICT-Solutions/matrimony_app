import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import '../Component/AppBar/header.dart';
import '../Component/footer.dart';

class ProfileHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(4.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://sharedp.com/wp-content/uploads/2024/06/cute-cartoon-girl-dp-960x1024.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.0.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('CHAT NOW'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.symmetric(vertical: 2.h),
                                        textStyle: TextStyle(
                                          fontSize: 1.6.t,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('SHARE PROFILE'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        padding: EdgeInsets.symmetric(vertical: 2.h),
                                        textStyle: TextStyle(
                                          fontSize: 1.6.t,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0.w),
                        Expanded(
                          flex: 1,
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0.h),
                    Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
