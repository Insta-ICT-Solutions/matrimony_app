import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  final String message;
  final String status;
  final IconData icon;  // Icon parameter
  final Color iconColor;  // Icon color parameter

  // Constructor to accept message, status, icon, and iconColor
  const SuccessPopup({
    Key? key,
    required this.message,
    required this.status,
    required this.icon,  // Accept icon as parameter
    required this.iconColor,  // Accept iconColor as parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 50),  // Use the icon and color passed in
          SizedBox(height: 16),
          Text(
            status,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text('OK',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
