import 'package:bright_weddings/Controller/edit_profile_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Buttons/hollow_button.dart';
import 'custom_text_widget.dart';
import 'date_field_widget.dart';
import 'phone_number_widget.dart';

class EditProfileFormMobile extends StatelessWidget {
  EditProfileFormMobile({super.key});

  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final EditProfileController controller = Get.find<EditProfileController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.9, // Increased width for better mobile fit
      padding: EdgeInsets.symmetric(
          vertical: 3.0.h,
          horizontal: 5.0.w), // Adjust padding for better spacing
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Edit My Profile',
            style: GoogleFonts.playfairDisplay(
                fontSize: 3.t, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          // Name and Email Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Name',
                placeholder: 'Enter Name',
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Text(
                'Email ID:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Email ID',
                placeholder: 'Enter Email',
              ),
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          // Phone Number and Address Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Phone Number',
                placeholder: 'Enter Phone Number',
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Text(
                'Address:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Address',
                placeholder: 'Enter Address',
              ),
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          // Gender, Blood Group, and Marriage Status Row
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Select Gender:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.6.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Builder(builder: (buttonContext) {
                        return Obx(() => HollowButton(
                            title: controller.selectedGender.value,
                            onTap: () {
                              controller.showPopUpGender(buttonContext);
                            },
                            height: 5.5.h,
                            width: 30.0.w));
                      }),
                    ],
                  )),
              SizedBox(
                width: 3.0.w,
              ),
              Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Select Blood Group:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.6.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Builder(builder: (buttonContext) {
                        return Obx(() => HollowButton(
                            title: controller.selectedBloodGroup.value,
                            onTap: () {
                              controller.showPopUp(buttonContext);
                            },
                            height: 5.5.h,
                            width: 30.0.w));
                      }),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 2.0.h,
          ),
          // Marriage Status and City Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marriage Status:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Builder(builder: (buttonContext) {
                return Obx(() => HollowButton(
                    title: controller.selectedMarriage.value,
                    onTap: () {
                      controller.showPopUpMarriage(buttonContext);
                    },
                    height: 5.5.h,
                    width: 30.0.w));
              }),
              SizedBox(
                height: 2.0.h,
              ),
              Text(
                'City:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'City',
                placeholder: 'Enter your city',
              ),
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          // Date of Birth and Age Row
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
                            fontSize: 1.6.t, fontWeight: FontWeight.normal),
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
                            fontSize: 1.6.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      CustomTextFieldWidget(
                        label: 'Age',
                        placeholder: 'Enter your Age',
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Height:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Height',
                placeholder: 'Enter your Height',
              ),
            ],
          ),
          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Family Type:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Family Type',
                placeholder: 'Enter your Family Type',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Father Name:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Father Name',
                placeholder: 'Enter your Father Name',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Mother Name:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Mother Name',
                placeholder: 'Enter your Mother Name',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Job Type:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Job Type',
                placeholder: 'Enter your Job Type',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Education:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Education',
                placeholder: 'Enter your Education',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Caste:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Caste',
                placeholder: 'Enter your Caste',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Sub Caste:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Sub Caste',
                placeholder: 'Enter your Sub Caste',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Ras:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Ras',
                placeholder: 'Enter your Ras',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Gen:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Gen',
                placeholder: 'Enter your Gen',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Devek:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Devek',
                placeholder: 'Enter your Devek',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Demands:',
                style: GoogleFonts.poppins(
                    fontSize: 1.6.t, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomTextFieldWidget(
                label: 'Demands',
                placeholder: 'Enter your Demands',
              ),
            ],
          ),

          SizedBox(
            height: 2.0.h,
          ),

          // Submit Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle form submission logic
                }
              },
              child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                padding:
                    EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 15.0.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
