import 'package:flutter/material.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: ProfileEditPage(),
  ));
}

class ProfileEditPage extends StatelessWidget {
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Key for the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            children: [
              SizedBox(height: 30),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Responsive width
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: 'https://png.pngtree.com/png-vector/20240106/ourmid/pngtree-cute-3d-indian-girl-with-jewelries-png-image_11417632.png', // network image
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {


                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Add functionality to update the profile picture
                            },
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            label: Text('Update Profile Picture', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Add functionality to share the profile
                            },
                            icon: Icon(Icons.share, color: Colors.white),
                            label: Text('Share Profile', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Container for Name, Email, Phone Number, and Address
              Container(
                width: MediaQuery.of(context).size.width * 0.9, // Responsive width
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildTextField('Name', 'Enter your full name'),
                    SizedBox(height: 15),
                    _buildTextField('Email', 'Enter email'),
                    SizedBox(height: 15),
                    _buildPhoneNumberField(),
                    SizedBox(height: 15),
                    _buildTextField('Address', 'Enter address'),
                  ],
                ),
              ),
              SizedBox(height: 30),

              Container(
                width: MediaQuery.of(context).size.width * 0.9, // Responsive width
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Gender', 'Male')),
                        SizedBox(width: 10),
                        Expanded(child: _buildTextField('City', 'City')),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(child: _buildDateField(context, 'Date of Birth')),
                        SizedBox(width: 10),
                        Expanded(child: _buildTextField('Age', 'Age')),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField('Height', 'Height'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Father's name", 'Father\'s name')),
                        SizedBox(height: 10),
                        Expanded(child: _buildTextField("Mother's name", 'Mother\'s name')),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Job Type', 'Job Type')),
                        SizedBox(width: 10),
                        Expanded(child: _buildTextField('Education', 'Education')),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                        }
                      },
                      child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // Footer Section
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter phone number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        errorStyle: TextStyle(color: Colors.red), // Style for the error message
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is required';
        } else if (value.length != 10) {
          return 'Phone number must be exactly 10 digits';
        }
        return null;
      },
    );
  }

  Widget _buildDateField(BuildContext context, String label) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          _birthDateController.text = formattedDate; // Set the value in the controller
        }
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: _birthDateController,
          decoration: InputDecoration(
            labelText: label,
            hintText: 'Select your birth date',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }
}
