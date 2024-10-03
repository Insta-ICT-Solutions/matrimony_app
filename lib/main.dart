import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:bright_weddings/View/Login/login.dart';
import 'package:bright_weddings/View/Profile/profiles.dart';
import 'package:bright_weddings/View/welcome_page/welcome_page.dart';
import 'package:bright_weddings/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/Helper/get_di.dart' as di;
import 'Component/Dashboard/success_story/dashboard_success_story.dart';
import 'Component/Dashboard/success_story/success_story.dart';
import 'Helper/size_config.dart';
import 'View/Dashboard/dashboard_web.dart';
import 'View/Profile/ProfileDetails/profile_details.dart';

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
            debugShowCheckedModeBanner: false,
              title: "Bright Weddings",
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
                primaryColor: Color(0xFFF3D48A),
              ),
              home:
              // successStory(),
             WelcomePage(),
              // LoginPage(),

              builder: EasyLoading.init());
        },
      );
    });
  }
}
