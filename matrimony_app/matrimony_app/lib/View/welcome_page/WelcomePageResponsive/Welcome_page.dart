import 'package:bright_weddings/View/Dashboard/dashboard_tab.dart';
import 'package:flutter/material.dart';

import '../../../Helper/responsive.dart';
import '../../Dashboard/dashboard_mobile.dart';
import '../welcome_page.dart';
import 'Welcome_page_Mobile.dart';


class WelcomePageResponsive extends StatelessWidget {
  const WelcomePageResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: WelcomePage(),
      mobile: WelcomePageMobile(),
      desktop: WelcomePage(),
    );
  }
}
