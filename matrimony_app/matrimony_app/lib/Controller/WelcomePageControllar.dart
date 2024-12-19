
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WelcomePageController extends GetxController {
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
