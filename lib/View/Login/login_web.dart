import 'package:bright_weddings/Component/Forms/login_form.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import '../../Helper/colors.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 5.0.h,
          ),
          Center(child: LoginForm(),),
          SizedBox(
            height: 7.0.h,
          ),
          Footer(),
        ],
      ),
    );
  }
}
