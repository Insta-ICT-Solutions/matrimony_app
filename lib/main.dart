import 'package:bright_weddings/Component/footer.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:bright_weddings/View/Login/login.dart';
import 'package:bright_weddings/chatlists/chatlistmobile.dart';
import 'package:bright_weddings/chatlists/chatlistweb.dart';
import 'package:bright_weddings/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/Helper/get_di.dart' as di;
import 'package:bright_weddings/chatlists/editprofile.dart';


import 'Helper/size_config.dart';


void main() async{
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
        builder: (BuildContext context, BoxConstraints constraints){
          return OrientationBuilder(
            builder: (BuildContext context2, Orientation orientation){
              SizeConfig.init(constraints, orientation);
              return GetMaterialApp(
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
                  primaryColor: Color(0xFFF3D48A),
                ),
                home: ProfileEditPage(),
              );
            },

          );
        }
    );
  }
}
