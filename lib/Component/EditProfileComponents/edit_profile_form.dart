import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../Controller/profile_controller.dart';
import 'custom_text_widget.dart';
import 'date_field_widget.dart';
import 'phone_number_widget.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({super.key});


  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final ProfileController controller = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          CustomTextFieldWidget(
            label: 'Full Name',
            placeholder: 'Enter your full name',
          ),
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
          CustomTextFieldWidget(
            label: 'Email',
            placeholder: 'Enter your email',
          ),
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
          PhoneNumberFieldWidget(
            controller: _phoneNumberController,
          ),
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
          CustomTextFieldWidget(
            label: 'Address',
            placeholder: 'Enter your address',
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
                          CustomTextFieldWidget(
                            label: 'Gender',
                            placeholder: 'Select gender',
                          ),
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
                          CustomTextFieldWidget(
                            label: 'City',
                            placeholder: 'Enter your city',
                          ),
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
                          DateFieldWidget(
                            controller: _birthDateController,
                            label: 'Birthdate',
                          ),
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
                          CustomTextFieldWidget(
                            label: 'Age',
                            placeholder: 'Enter your Age',
                          ),
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
                          CustomTextFieldWidget(
                            label: 'Height',
                            placeholder: 'Enter your height',
                          ),
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
                            'Family Type:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Family Type',
                            placeholder: 'Enter your family type',
                          ),
                        ],
                      ))
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
                          CustomTextFieldWidget(
                            label: 'Fathers Name',
                            placeholder: 'Enter your fathers name',
                          ),
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
                          CustomTextFieldWidget(
                            label: 'Mothers Name',
                            placeholder: 'Enter your mothers name',
                          ),
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
                            'Job type:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Job Type',
                            placeholder: 'Job type',
                          ),
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
                          CustomTextFieldWidget(
                            label: 'Education',
                            placeholder: 'Enter your education',
                          ),
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
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.0.h),
            ],
          )
        ],
      ),
    );
  }
}

