import 'package:bright_weddings/View/Pager/pager_mobile.dart';
import 'package:bright_weddings/View/Pager/pager_web.dart';
import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';

class Pager extends StatelessWidget {
  const Pager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: PagerWeb(),
      mobile: PagerMobile(),
      desktop: PagerWeb(),
    );
  }
}
