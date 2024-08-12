import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';
import 'dashboard_mobile.dart';
import 'dashboard_web.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: DashboardWeb(),
      mobile: DashboardMobile(),
      desktop: DashboardWeb(),
    );
  }
}
