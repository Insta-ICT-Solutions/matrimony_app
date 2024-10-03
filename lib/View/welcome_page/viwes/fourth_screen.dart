import 'package:bright_weddings/View/welcome_page/utils.dart';

import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 50),
            height: 700,
            width: 700,
            child: Image(
              image: AssetImage('assets/images/mt.png'),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                width: 10, // Adjust the width as needed
                height: 200, // Height of the line
                decoration: BoxDecoration(
                  color: SysColor.pinkShade,
                ),
              ),
              Dimensions.spacer40,
              Container(
                width: 10, // Adjust the width as needed
                height: 200, // Height of the line
                decoration: BoxDecoration(
                  color: SysColor.pinkShade,
                ),
              ),
              Dimensions.spacer40,
              Container(
                width: 10, // Adjust the width as needed
                height: 200, // Height of the line
                decoration: BoxDecoration(
                  color: SysColor.pinkShade,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimensions.spacer100,
              Text(
                '"Our matrimony website is dedicated to \n'
                'helping you find your perfect match. \n'
                'With advanced search filters and \n'
                'verified profiles."',
                style: FontStyles.bodyText.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Dimensions.spacer50,
              Text(
                '“we ensure a safe and personalized \n'
                'experience for every user. Start your \n'
                'journey towards a meaningful \n'
                'relationship today.”',
                style: FontStyles.bodyText.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Dimensions.spacer100,
              Dimensions.spacer50,
              Text(
                '"At our matrimony website, \n'
                'we believe in creating beautiful love \nstories.'
                'With a vast database of genuine \n'
                'profiles and personalized \n'
                'matchmaking services.”',
                style: FontStyles.bodyText.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
