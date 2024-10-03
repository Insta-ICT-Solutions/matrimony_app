import 'dart:math';
import 'package:bright_weddings/View/welcome_page/viwes/first_screen.dart';
import 'package:bright_weddings/View/welcome_page/viwes/fourth_screen.dart';
import 'package:bright_weddings/View/welcome_page/viwes/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/footer.dart';

class WelcomePageController extends GetxController {
  var selectedImageUrl = ''.obs;

  // List of different image URLs
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/28210860/pexels-photo-28210860/free-photo-of-a-bride-and-groom-are-getting-their-wedding-ceremony.jpeg',
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

class WelcomePage extends StatelessWidget {
  // Instantiate the controller using GetX

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        // showDashboard: false,
        showLogin: false,
        showRegistration: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstPage(),
            SizedBox(
              height: 50,
            ),
            ThirdScreen(),
            SizedBox(
              height: 100,
            ),
            FourthScreen(),
            SizedBox(height: 100),
            Footer(),
          ],
        ),
      ),
    );
  }
}
