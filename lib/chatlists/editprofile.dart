import 'package:bright_weddings/Component/image_card.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Component/AppBar/header.dart';
import '../Component/footer.dart';
import '../Controller/profile_controller.dart';
import '../Helper/colors.dart';

class ProfileEditPage extends StatelessWidget {
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final ProfileController controller = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();

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
                  width: MediaQuery.of(context).size.width *
                      0.8, // Responsive width
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 25.0.h,
                            width: 90.0.w,
                            child: ImageCard(
                              imageUrl:
                                  'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
                              borderRadius: BorderRadius.zero,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return _buildBottomSheet(context);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              );
                            },
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            label: Text('Update Profile Picture',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 10.0.w),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.share, color: Colors.white),
                            label: Text('Share Profile',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 12.5.w),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4.0.h),
              Container(
                width:
                    MediaQuery.of(context).size.width * 0.7, // Responsive width
                padding:
                    EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 10.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Edit My Profile',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 2.t, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Text(
                      'Name:',
                      style: GoogleFonts.poppins(
                          fontSize: 1.1.t, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    _buildTextField('Name', 'Enter your full name'),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      'Email:',
                      style: GoogleFonts.poppins(
                          fontSize: 1.1.t, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    _buildTextField('Email', 'Enter email'),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      'Phone Number:',
                      style: GoogleFonts.poppins(
                          fontSize: 1.1.t, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    _buildPhoneNumberField(),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      'Address:',
                      style: GoogleFonts.poppins(
                          fontSize: 1.1.t, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    _buildTextField('Address', 'Enter address'),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Divider(
                      height: 1.0.h,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Address:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField('Gender', 'Male')
                                  ],
                                )),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'City:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField('City', 'City')
                                  ],
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Date of Birth:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildDateField(context, 'Date of Birth')
                                  ],
                                )),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Age:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField('Age', 'Age')
                                  ],
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Height:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField('Height', 'Height')
                                  ],
                                )
                            ),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Family Type:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField(
                                        'Family Type', 'Family Type')
                                  ],
                                )
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        Divider(
                          height: 1.0.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Fathers Name:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField(
                                        'Fathers Name', 'Fathers Name')
                                  ],
                                )),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Mothers Name:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField(
                                        'Mothers Name', 'Mothers Name')
                                  ],
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Job type:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField('Job type', 'Job type')
                                  ],
                                )),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      'Education:',
                                      style: GoogleFonts.poppins(
                                          fontSize: 1.1.t,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    _buildTextField('Education', 'Education')
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(height: 4.0.h),
                        Row(
                          children: [
                            Flexible(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Handle form submission
                                    }
                                  },
                                  child: Text('SUBMIT',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF607D8B),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.5.h, horizontal: 60.0.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),)
                          ],
                        ),
                        SizedBox(height: 3.0.h),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(height: 50),

              // Footer Section
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the BottomSheet
  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[200]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 6,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Text(
            'Update Profile Picture',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 20),

          //for update from camera

          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.2),
              ),
              child: Icon(Icons.camera_alt, color: Colors.blueAccent),
            ),
            title:
                Text('Update from Camera'), // Option to update from the camera
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // for update from device
          Obx(() => ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent.withOpacity(0.2),
                  ),
                  child: Icon(Icons.photo_library, color: Colors.orangeAccent),
                ),
                title: Text(controller.selectedFileName.value),
                onTap: () {
                  controller.pickFile(FileType.image, false);
                  Navigator.pop(context);
                },
              )),
        ],
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
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: _phoneNumberController,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter phone number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        } else if (value.length != 10) {
          return 'Phone number must be 10 digits';
        }
        return null;
      },
    );
  }

  Widget _buildDateField(BuildContext context, String label) {
    return TextFormField(
      controller: _birthDateController,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Select date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          _birthDateController.text =
              DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
    );
  }
}
