import 'package:bright_weddings/Component/Buttons/hollow_button.dart';
import 'package:bright_weddings/Component/Buttons/submit_button.dart';
import 'package:bright_weddings/Component/TextFields/input_field.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/path_constants.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoFormTwoMobile extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  InfoFormTwoMobile({super.key, required this.onBack, required this.onNext});

  final NewRegistrationController controller =
  Get.find<NewRegistrationController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB39DDB), Color(0xFF9575CD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Now",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black54, fontSize: 16),
                ),
                Text(
                  "Find your\nlife partner",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Easy and fast.",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    loginCouplePNG,
                    width: screenWidth * 0.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Form Section
          Text(
            "JUST FEW THINGS MORE",
            style: GoogleFonts.poppins(fontSize: 14, color: textColor),
          ),
          Text(
            "Continue the Journey",
            style: GoogleFonts.playfairDisplay(
                fontSize: 18, color: Color(0xFF333333)),
          ),
          SizedBox(height: 16),
          Divider(color: borderColor),
          SizedBox(height: 16),

          // Input Fields
          _buildTextField("Cast:", "Enter Cast", controller.castController),
          _buildTextField("Subcast:", "Enter Subcast", controller.subCastController),
          Row(
            children: [
              Expanded(
                child: _buildTextField("Ras:", "Enter Ras", controller.rasController),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildTextField("Gan:", "Enter Gan", controller.ganController),
              ),
            ],
          ),
          _buildTextField("Devak:", "Enter Devak", controller.devakController),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blood group:",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Builder(builder: (context) {
                      return Obx(() => HollowButton(
                        title: controller.selectedBloodGroup.value,
                        onTap: () {
                          controller.showPopUp(context);
                        },
                        height: 40,
                        width: double.infinity,
                      ));
                    }),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildTextField(
                    "Demands:", "Enter Demands (Optional)", controller.demandController),
              ),
            ],
          ),
          SizedBox(height: 24),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SubmitButton(title: "Go back", onTap: onBack),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SubmitButton(title: "Save & next", onTap: onNext),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          InputField(
            labelText: hintText,
            controller: controller,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
