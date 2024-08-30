import 'package:bright_weddings/View/EditProfile/editprofile.dart';
import 'package:bright_weddings/View/ProfileHistory/profile_history.dart';
import 'package:bright_weddings/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/Helper/get_di.dart' as di;
import 'Helper/size_config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(
        builder: (BuildContext context2, Orientation orientation) {
          SizeConfig.init(constraints, orientation);
          return GetMaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
              primaryColor: Color(0xFFF3D48A),
            ),
            home: ProfileHistory(),
          );
        },
      );
    });
  }
}
