import 'package:bright_weddings/View/welcome_page/welcome_page.dart';
import 'package:bright_weddings/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/Helper/get_di.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'Helper/size_config.dart';
import 'View/New Client Registration/new_client_registration.dart';


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
                // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
                // primaryColor: Color(0xFFF3D48A),

                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4833CE)), // Red theme based on a red seed color
                primaryColor: Color(0xFFF3D48A), // Primary color set to red
              ),
              home: AuthWrapper(),
              builder: EasyLoading.init());
        },
      );
    });
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return snapshot.data ?? SizedBox();
      },
    );
  }

  Future<Widget> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? uid = sharedPreferences.getString("uid");
    if (uid != null) {
      return NewClientRegistration();
    } else {
      return WelcomePage();
    }
  }
}


