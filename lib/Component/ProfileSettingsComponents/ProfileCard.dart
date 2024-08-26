import 'package:flutter/material.dart';
import 'package:bright_weddings/Helper/size_config.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isProfileVisible = true;
  bool isStatusChangeable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 2.5.t,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.5.w),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 4.w,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/05/31/cd/0531cdc867499b585db877813344c44b.jpg',
                      ),
                    ),
                    title: Text(
                      'Anna Jaslin',
                      style: TextStyle(fontSize: 1.8.t),
                    ),
                    subtitle: Text(
                      'Premium user',
                      style: TextStyle(fontSize: 1.3.t),
                    ),
                  ),
                  Divider(),
                  _buildSwitchListTile(
                    title: 'Profile visible',
                    subtitle: 'You can set-up the visibility of profile.',
                    value: isProfileVisible,
                    onChanged: (bool value) {
                      setState(() {
                        isProfileVisible = value;
                      });
                    },
                  ),
                  Divider(),
                  _buildSwitchListTile(
                    title: 'Change Status',
                    subtitle: 'You can change the status of profile.',
                    value: isStatusChangeable,
                    onChanged: (bool value) {
                      setState(() {
                        isStatusChangeable = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
      title: Text(
        title,
        style: TextStyle(fontSize: 1.8.t),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 1.3.t),
      ),
    );
  }
}
