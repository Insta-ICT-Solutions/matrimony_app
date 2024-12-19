import 'package:bright_weddings/Helper/size_config.dart';
import 'package:bright_weddings/View/Login/login_web.dart';
import 'package:bright_weddings/View/welcome_page/image_card.dart';
import 'package:bright_weddings/View/welcome_page/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:parallax_animation/parallax_area.dart';
import 'package:parallax_animation/parallax_widget.dart';
import '../../Controller/WelcomePageControllar.dart';
import '../pop_up_Screen/LoginPopUp.dart';
import '../pop_up_Screen/button.dart';

class WelcomePage extends StatelessWidget {
  // Instantiate the controller using GetX
  final WelcomePageController controller = Get.put(WelcomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        // showDashboard: false,
        showLogin: false,
        showRegistration: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Gradient Background
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red.shade900, Colors.blue.shade900],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                // Overlay with Image and Text
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.selectedImageUrl.value,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Find Your Best Match',
                              style: GoogleFonts.playfairDisplay(
                                color: Colors.white,
                                fontSize: 4.h,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Welcome to Bright Weddings',
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 2.h,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoginPopUpButton(),
                                SizedBox(width: 16),
                                PopUpButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            // RegistrationForm(),

            Stack(
              children: [
                // Background image from the network with opacity
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.2, // Adjust the opacity value as needed
                    child: Image.network(
                      'https://images.pexels.com/photos/2395249/pexels-photo-2395249.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Your original image (rose.jpg) can still be kept here if needed
                Positioned(
                  child: Image(
                    image: AssetImage('assets/images/rose.jpg'),
                    fit: BoxFit.cover,
                    // width: double.infinity, (this is commented, you can remove this comment if needed)
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
                                  image: AssetImage(
                                      'assets/images/who_we_are.png'),
                                ),
                              ),
                              Text('Who We Are',
                                  style: FontStyles.whoWeAreText),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'We are a dedicated team bringing matrimonial solutions to '
                            '\nthe masses in their search for their life partner.'
                            '\nJoin us in transforming your dreams of a perfect partner'
                            '\n into a beautiful reality.',
                            textAlign: TextAlign.center,
                            style: FontStyles.descriptionText,
                          ),
                          SizedBox(height: 200),
                          Text('Personalized Matchmaking',
                              style: FontStyles.whoWeAreText),
                          SizedBox(height: 20),
                          Text(
                            'We offer customized matchmaking services tailored  '
                            '\nto your preferences and requirements,'
                            '\n ensuring a perfect match.',
                            textAlign: TextAlign.center,
                            style: FontStyles.descriptionText,
                          ),
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

            SizedBox(height: 10),

            Column(
              children: [
                Text(
                  'Happy Clients',
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.red[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons
                          .handshake, // Choose an appropriate icon for testimonials
                      color: Colors.red[900],
                      size: 3.h, // Adjust size as needed
                    ),
                    SizedBox(width: 1.5.h),
                    Text(
                      'Testimonials',
                      style: GoogleFonts.playfairDisplay(
                        color: SysColor.blueShadeColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'See what our happy clients have to say about their experiences with our matrimonial services.',
                  textAlign: TextAlign.center,
                  style: FontStyles.descriptionText.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(height: 20),
                ParallaxArea(
                  child: CarouselSlider(
                    items: controller.imageUrls.map((url) {
                      return ParallaxWidget(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
             Text(
                    'Trusted By Millions',
                    style: TextStyle(
                      fontSize: 2.0.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),

            SizedBox(height: 5.h),
            Footer(),
          ],
        ),
      ),
    );
  }
}
