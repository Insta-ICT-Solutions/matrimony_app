import 'dart:convert';
import 'dart:ui';
import 'package:bright_weddings/Constants/app_constants.dart';
import 'package:bright_weddings/Helper/button.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Login/login_web.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Login/login.dart';

class PopUpButton extends StatefulWidget {
  @override
  _PopUpButtonState createState() => _PopUpButtonState();
}

class _PopUpButtonState extends State<PopUpButton> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;



  Future<bool> registerUser() async {

    // Build the request body
    final Map<String, String> requestBody = {
      "employeeName": _fullNameController.text.trim(),
      "phoneNumber": _mobileNumberController.text.trim(),
      "branch": _branchController.text.trim(),
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
      "confirmPassword": _confirmPasswordController.text,
    };

    try {
      print("Request Body: ${jsonEncode(requestBody)}");

      // Send POST request
      final response = await http.post(
        Uri.parse(baseUrl+registerUrl),
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
    // Dispose controllers and nullify them to avoid accessing disposed objects
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileNumberController.dispose();
    _branchController.dispose();

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
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              //     child: Container(color: Colors.black.withOpacity(0.3)),
              //   ),
              // ),
              Center(
                child: Container(
                  width: 500,
                  height: 720,
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
                                    "Employee Registration",
                                    style: GoogleFonts.playfairDisplay(
                                      color: Colors.red[900],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      // letterSpacing: 5,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                _buildFormField(
                                  "Full Name:",
                                  _fullNameController,
                                  "Enter your full name",
                                  Icons.person,
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                _buildFormField(
                                  "Mobile Number:",
                                  _mobileNumberController,
                                  "Enter your mobile number",
                                  Icons.phone,
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your mobile number';
                                    }
                                    if (value.length != 10) {
                                      return 'Mobile number must be 10 digits';
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.phone,
                                ),
                                SizedBox(height: 16.0),
                                _buildFormField(
                                  "Branch:",
                                  _branchController,
                                  "Enter your branch",
                                  Icons.business,
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your branch';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                _buildFormField(
                                  "Email Address:",
                                  _emailController,
                                  "Enter your email ID",
                                  Icons.email,
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$")
                                        .hasMatch(value)) {
                                      return 'Please enter Valid Email';
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
                                  // Icons.password_rounded,
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
                                SizedBox(height: 16.0),
                                _buildPasswordField(
                                  "Confirm Password:",
                                  _confirmPasswordController,
                                  "Re-enter your password",
                                  _isConfirmPasswordVisible,
                                      (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                      () {
                                    setState(() {
                                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),

                                SizedBox(height: 30.0),
                                Center(
                                  child: HoverButton(
                                    buttonText: 'Register Yourself',
                                    height: 25,
                                    width: 10,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        // Show loading indicator
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Registering, please wait...')),
                                        );

                                        // Wait for the API call to complete and get the result
                                        bool registrationSuccessful = await registerUser();

                                        if (registrationSuccessful) {
                                          // Navigate to LoginWeb on success
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginPage()),
                                          );
                                        } else {
                                          // Show an error message on failure
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Registration Failed')),
                                          );
                                        }
                                      }
                                    },
                                  ),


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
            fontSize: 12.0,
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
            fontSize: 12.0,
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
            prefixIcon: Icon(Icons.lock, color: Color(0xFFE53E3E)), // Optional
            border: OutlineInputBorder(),
            // Removed the eye icon here
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
          buttonText: 'Employee Registration',
          height: 2.h,
          width: 2.w,
          onPressed: () => _showLoginPopup(context),
        ),
      ),
    );
  }
}
