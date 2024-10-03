import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bright_weddings/Helper/button.dart';
import 'package:bright_weddings/View/welcome_page/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoPageControlar extends GetxController {
  var selectedImageUrl = ''.obs;

  // List of different image URLs
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/28210860/pexels-photo-28210860/free-photo-of-a-bride-and-groom-are-getting-their-wedding-ceremony.jpeg',
    'https://images.pexels.com/photos/10053754/pexels-photo-10053754.jpeg',
    'https://images.pexels.com/photos/5759215/pexels-photo-5759215.jpeg',
    'https://images.pexels.com/photos/27605325/pexels-photo-27605325/free-photo-of-a-bride-and-groom-in-traditional-indian-attire.png',
  ];

  @override
  void onInit() {
    super.onInit();
    selectRandomImage();
  }

  // Method to randomly select an image
  void selectRandomImage() {
    final random = Random();
    selectedImageUrl.value = imageUrls[random.nextInt(imageUrls.length)];
  }
}

class FirstPage extends StatelessWidget {
  // Instantiate the controller using GetX
  final PhotoPageControlar controller = Get.put(PhotoPageControlar());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight:
                      Radius.circular(500.0), // Match the curve of ClipRRect
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.3), // Shadow color and transparency
                    spreadRadius: 9, // Spread the shadow a little
                    blurRadius: 12, // Blur radius for smooth shadow
                    offset:
                        Offset(0, 5), // Slight vertical offset for shadow depth
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(500.0),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(),
                  child: Obx(() => Image.network(
                        controller.selectedImageUrl.value,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Your',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.red[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Best Match',
                      style: GoogleFonts.playfairDisplay(
                        color: SysColor.blueShadeColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Text(
                        'Welcome to BRIGHT WEDDING,\n'
                        'Your trusted partner in finding the perfect life companion. Our platform connects like-minded individuals through a secure and user-friendly interface. With personalized matchmaking, verified profiles, and diverse community features, we aim to help you embark on a beautiful journey of love and togetherness..',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: Color(0xFF4A5568),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        HoverButton(
                          buttonText: 'Get Started',
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        HoverButton(
                          buttonText: 'Explore More ',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Meet Your Soulmate Through Our Trusted Platform!',
                          textAlign: TextAlign.center,
                          textStyle: FontStyles.welcomeText.copyWith(
                              color: SysColor.blueShadeColor, fontSize: 25),
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
