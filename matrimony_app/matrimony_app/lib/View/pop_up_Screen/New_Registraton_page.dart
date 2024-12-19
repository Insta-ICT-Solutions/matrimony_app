import 'dart:convert';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Constants/app_constants.dart';
import 'package:bright_weddings/Helper/button.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Login/login_web.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../Component/AppBar/Header_mobile.dart';
import '../../Component/footer_mobile.dart';
import '../Login/login.dart';
import 'ShowPopUp.dart';

class EmployeeRegistrationPage extends StatefulWidget {
  @override
  _EmployeeRegistrationPageState createState() => _EmployeeRegistrationPageState();
}

class _EmployeeRegistrationPageState extends State<EmployeeRegistrationPage> {
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
    final Map<String, String> requestBody = {
      "employeeName": _fullNameController.text.trim(),
      "phoneNumber": _mobileNumberController.text.trim(),
      "branch": _branchController.text.trim(),
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
      "confirmPassword": _confirmPasswordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(baseUrl + registerUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileNumberController.dispose();
    _branchController.dispose();
    super.dispose();
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
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: toggleVisibility,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderMobile(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: screenWidth * 0.9, // Adjust container width dynamically
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Employee Registration",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.red[900],
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
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
                            if (!RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$").hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 25.0),
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
                            height: 20,
                            width: 50,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Logging in, please wait...'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                bool loginSuccessful = await registerUser();

                                if (loginSuccessful) {
                                  _showSuccessPopup(
                                    context,
                                    'You have logged in successfully.',
                                    'Login Successful',
                                    Icons.check_circle,
                                    Colors.green,
                                  );

                                  Future.delayed(Duration(milliseconds: 50), () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginPage()),
                                    );
                                  });
                                } else {
                                  _showSuccessPopup(
                                    context,
                                    'Login Failed. Please try again.',
                                    'Login Failed',
                                    Icons.error,
                                    Colors.red,
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          FooterMobile(), // Add the footer here
        ],
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
