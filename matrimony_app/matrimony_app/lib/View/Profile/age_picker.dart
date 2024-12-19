import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AgePicker extends GetxController {
  final searchController = TextEditingController();
  final minAge = 18.0; // Minimum age
  final maxAge = 60.0; // Maximum age
  var selectedMinAge = 18.0.obs;
  var selectedMaxAge = 35.0.obs;

  // This should point to your existing user data list in the UI
  List<Map<String, dynamic>> userList = []; // Replace with your actual list of users

  void filterSearch(String query) {
    // Add logic for filtering based on the search query.
  }

  void updateAgeRange(double minAge, double maxAge) {
    selectedMinAge.value = minAge;
    selectedMaxAge.value = maxAge;

    // Optionally, filter users based on age range here
    filterByAgeRange();
  }

  List<Map<String, dynamic>> filterByAgeRange() {
    // Directly filter the existing user list based on the selected age range
    return userList.where((user) {
      return user['age'] >= selectedMinAge.value &&
          user['age'] <= selectedMaxAge.value;
    }).toList();
  }
}
