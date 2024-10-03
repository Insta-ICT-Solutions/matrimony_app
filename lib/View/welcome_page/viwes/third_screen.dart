import 'package:bright_weddings/View/welcome_page/image_card.dart';
import 'package:bright_weddings/View/welcome_page/utils.dart';

import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Image(
              image: AssetImage('assets/images/rose.jpg'),
              fit: BoxFit.cover,
              // width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          child: Image(
                            image: AssetImage('assets/images/who_we_are.png'),
                          ),
                        ),
                        Text('Who We Are', style: FontStyles.whoWeAreText),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                        'We are a dedicated team bringing matrimonial solutions to '
                        '\nthe masses in their search for their life partner.'
                        '\nJoin us in transforming your dreams of a perfect partner'
                        '\n into a beautiful reality.',
                        textAlign: TextAlign.center,
                        style: FontStyles.descriptionText),
                    SizedBox(height: 200),
                    Text('Personalized Matchmaking',
                        style: FontStyles.whoWeAreText),
                    SizedBox(height: 20),
                    Text(
                        'We offer customized matchmaking services tailored  '
                        '\nto your preferences and requirements,'
                        '\n ensuring a perfect match.',
                        textAlign: TextAlign.center,
                        style: FontStyles.descriptionText),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    ImageContainer(
                      imagePath: 'assets/images/1.jpg',
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                      ),
                    ),
                    Dimensions.spacer50,
                    ImageContainer(
                      imagePath: 'assets/images/3.jpg',
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimensions.spacer100,
                    ImageContainer(
                      imagePath: 'assets/images/4.jpg',
                      height: 350,
                      width: 350,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    Dimensions.spacer50,
                    ImageContainer(
                      imagePath: 'assets/images/7.jpg',
                      height: 300,
                      width: 350,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
