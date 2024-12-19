import 'package:bright_weddings/Helper/button.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/View/Login/login_web.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Define controllers for form fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/av.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Form Container with shadow
          Positioned(
            right: 150, // Position the form on the right side.
            top: 70,
            child:
            Container(
              width: 550, // Set a fixed width for the form
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.9), // Optional: semi-transparent background
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Full Name label
                      Center(
                        child: Text(
                          "Employee Login",
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.red[900],
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        "Full Name:",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      // Full Name input field
                      TextFormField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFFE53E3E),
                          ), // Person icon
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Email Address:",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      // Email input field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email ID',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFE53E3E),
                          ), // Person icon
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Password:",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      // Password input field
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: Icon(
                            Icons.password_rounded,
                            color: Color(0xFFE53E3E),
                          ), // Person icon
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 50.0),
                      Center(
                        child: HoverButton(
                          buttonText: 'Register ',
                          height: 20,
                          width: 100,
                          onPressed: () {
                            _submitForm();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginWeb()),
                            );
                          },
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
  }
}
