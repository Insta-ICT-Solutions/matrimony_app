import 'dart:convert';
import 'dart:ui';
import 'package:bright_weddings/Constants/app_constants.dart';
import 'package:bright_weddings/Helper/button.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/New%20Client%20Registration/new_client_registration.dart';
import 'package:bright_weddings/View/pop_up_Screen/ShowPopUp.dart';
import 'package:bright_weddings/View/pop_up_Screen/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/login.dart';
import '../Login/login_web.dart';
import 'New_Registraton_page.dart';
import 'forgot_password.dart';

class LoginPopUpButton extends StatefulWidget {
  @override
  _LoginPopUpButtonState createState() => _LoginPopUpButtonState();
}

class _LoginPopUpButtonState extends State<LoginPopUpButton> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  bool _isPasswordVisible = false;

  Future<bool> loginUser() async {
    // Build the request body
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final Map<String, String> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    };

    try {
      print("Request Body: ${jsonEncode(requestBody)}");

      // Send POST request
      final response = await http.post(
        Uri.parse(baseUrl + loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // Log response details
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
        sharedPreferences.setString("uid", responseData['userId']!);
        sharedPreferences.setString("token", responseData['token']!);
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
    _passwordController.dispose();
    super.dispose();
  }

  void _showLoginPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              // Positioned.fill(
              //
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              //     child: Container(color: Colors.black.withOpacity(0.3)),
              //   ),
              // ),
              Center(
                child: Container(
                  width: 320,
                  height: 480,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.black),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.playfairDisplay(
                                      color: Colors.red[900],
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                _buildFormField(
                                  "Email Address:",
                                  _emailController,
                                  "Enter your email ID",
                                  Icons.email,
                                  (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(
                                            r"^[a-zA-Z0-9._%+-]+@gmail\.com$")
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 16.0),
                                _buildPasswordField(
                                  "Password:",
                                  _passwordController,
                                  "Enter your password",
                                  _isPasswordVisible,
                                  (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                  () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                SizedBox(height: 30.0),
                                Center(
                                    child: HoverButton(
                                  buttonText: 'Login',
                                  height: 25,
                                  width: 40,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      // Show loading indicator
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Logging in, please wait...')),
                                      );

                                      // Wait for the API call to complete and get the result
                                      bool loginSuccessful = await loginUser();

                                      if (loginSuccessful) {
                                        // Show success popup with custom icon and color
                                        _showSuccessPopup(
                                          context,
                                          'You have logged in successfully.',
                                          'Login Successful',
                                          Icons
                                              .check_circle, // Example of a success icon
                                          Colors
                                              .green, // Example of a success color
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      } else {
                                        // Show failure popup with a different icon and color
                                        _showSuccessPopup(
                                          context,
                                          'Login Failed. Please try again.',
                                          'Login Failed',
                                          Icons
                                              .error, // Example of an error icon
                                          Colors
                                              .red, // Example of an error color
                                        );
                                      }
                                    }
                                  },
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to the target screen (e.g., RegisterPage)
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeRegistrationPage()), // Replace RegisterPage with your target screen widget
                                        );
                                      },
                                      child: Text("Register Now"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to the target screen (e.g., RegisterPage)
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPasswordPage()), // Replace RegisterPage with your target screen widget
                                        );
                                      },
                                      child: Text("Forgot Password"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String hint,
    IconData icon,
    String? Function(String?)? validator, {
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Color(0xFFE53E3E)),
            border: OutlineInputBorder(),
          ),
          keyboardType: inputType,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField(
    String label,
    TextEditingController controller,
    String hint,
    bool isPasswordVisible,
    String? Function(String?)? validator,
    VoidCallback toggleVisibility,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(Icons.lock, color: Color(0xFFE53E3E)),
            // suffixIcon: IconButton(
            //   icon: Icon(
            //     isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            //   ),
            //   onPressed: toggleVisibility,
            // ),
            border: OutlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: HoverButton(
          buttonText: 'Login',
          height: 2.h,
          width: 2.w,
          onPressed: () => _showLoginPopup(context),
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
