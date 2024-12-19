import 'package:bright_weddings/Controller/edit_profile_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Buttons/hollow_button.dart';
import 'custom_text_widget.dart';
import 'date_field_widget.dart';
import 'phone_number_widget.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({super.key});

  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final EditProfileController controller = Get.find<EditProfileController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7, // Responsive width
      padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 10.0.w),
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
          Text(
            'Edit My Profile',
            style: GoogleFonts.playfairDisplay(
                fontSize: 2.t, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.0.h,
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
                        'Name:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.1.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      CustomTextFieldWidget(
                        label: 'Name',
                        placeholder: 'Enter Name',
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
                        'Email ID:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.1.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      CustomTextFieldWidget(
                        label: 'Email ID',
                        placeholder: 'Enter Email',
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
                        'Phone Number:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.1.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      CustomTextFieldWidget(
                        label: 'Phone Number',
                        placeholder: 'Enter Phone Number',
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
                        'Address:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.1.t, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      CustomTextFieldWidget(
                        label: 'Address',
                        placeholder: 'Enter Address',
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Select Gender:',
                                style: GoogleFonts.poppins(
                                    fontSize: 1.1.t,
                                    fontWeight: FontWeight.normal),
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
                                    height: 3.5.h,
                                    width: 25.0.w));
                              }),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Select Blood Group:',
                        style: GoogleFonts.poppins(
                            fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                            height: 3.5.h,
                            width: 25.0.w
                        ));
                      }),
                    ],
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Marriage Status :',
                        style: GoogleFonts.poppins(
                            fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                            height: 3.5.h,
                            width: 25.0.w));
                      }),
                    ],
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
                            height: 1.0.h,
                          ),
                          Text(
                            'City:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
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
                            'Cast:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Cast',
                            placeholder: 'Cast',
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
                            'Subcast:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Subcast',
                            placeholder: 'Enter your Subcast',
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
                            'Ras:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Ras',
                            placeholder: 'Enter Ras',
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
                            'Gen:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Gen',
                            placeholder: 'Enter your Gen',
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
                            'Devek:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Devek',
                            placeholder: 'Devek Ras',
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
                            'Demand:',
                            style: GoogleFonts.poppins(
                                fontSize: 1.1.t, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          CustomTextFieldWidget(
                            label: 'Demand',
                            placeholder: 'Enter your Demand',
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
                      child:
                          Text('SUBMIT', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Colors.red[600],
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
