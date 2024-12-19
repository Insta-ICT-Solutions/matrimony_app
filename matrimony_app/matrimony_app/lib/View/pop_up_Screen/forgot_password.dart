import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/AppBar/header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/app_constants.dart';
import '../../Helper/button.dart';
import 'ShowPopUp.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();





  Future<bool> sendResetPasswordRequest() async {
    // Build the request body
    final Map<String, String> requestBody = {
      "email": _emailController.text.trim(),
    };

    try {
      print("Request Body: ${jsonEncode(requestBody)}");

      // Send POST request
      final response = await http.post(
        Uri.parse(baseUrl + forgotPasswordUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // Log response details
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
        return true;
      } else {
        // Handle non-200 responses
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
        return false;
      }
    } catch (e) {
      // Handle exceptions (e.g., network errors)
      print("Network Error: $e");
      return false;
    }
  }


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth * 0.9,
            constraints: BoxConstraints(
              maxWidth: 500, // Set a max width for larger screens
            ),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Display Network Image
                  Container(
                    height: 22.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(

                        image: NetworkImage(
                          'https://img.freepik.com/free-vector/forgot-password-concept-illustration_114360-1010.jpg?t=st=1732257823~exp=1732261423~hmac=291d50da541e2f297c06aacc6eadd31cad0200a331c7cdb552de7ee38bf9f03a&w=740', // Replace with your image URL
                        ),
                        fit: BoxFit.cover,
                      ),
                      // shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Title Text
                  Text(
                    "Forgot Password",
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.red[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email ID",
                      prefixIcon: Icon(Icons.email, color: Colors.red[900]),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$").hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.0),
                  // Reset Button
              HoverButton(
                buttonText: 'Reset Password',
                height: 20,
                width: 50,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Show a loading indicator
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Processing request, please wait...'),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Wait for the API call to complete
                    bool resetSuccessful = await sendResetPasswordRequest();

                    if (resetSuccessful) {
                      // Show success popup with a custom icon and color
                      _showSuccessPopup(
                        context,
                        'Password reset link sent to your email.',
                        'Request Successful',
                        Icons.check_circle, // Example of a success icon
                        Colors.green, // Example of a success color
                      );

                      // Optionally, navigate to the login screen or close the current page
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context); // Navigate back after showing the popup
                      });
                    } else {
                      // Show failure popup with a different icon and color
                      _showSuccessPopup(
                        context,
                        'Failed to send reset link. Please try again.',
                        'Request Failed',
                        Icons.error, // Example of an error icon
                        Colors.red, // Example of an error color
                      );
                    }
                  }
                },
              ),


              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showSuccessPopup(BuildContext context, String message, String status,
    IconData icon, Color iconColor) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SuccessPopup(
        message: message,
        status: status,
        icon: icon, // Pass the icon
        iconColor: iconColor, // Pass the color
      );
    },
  );
}