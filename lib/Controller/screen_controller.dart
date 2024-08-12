import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ScreenController extends GetxController{

  var selectedScreen = 0.obs;

  var screens = <Widget>[
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
  ].obs;

}