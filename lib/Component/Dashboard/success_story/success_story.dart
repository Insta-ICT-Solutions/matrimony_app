import 'package:bright_weddings/Component/footer.dart';
import 'package:flutter/material.dart';
import '../../AppBar/header.dart';
import '../../Footer/footer.dart'; // Import the Footer widget

class successStory extends StatefulWidget {
  const successStory({super.key});

  @override
  State<successStory> createState() => _successStoryState();
}

class _successStoryState extends State<successStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Container(
          height: 800,
          width: 1800,
          // color: Colors.black,

          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Success Stories of Bright Weddings',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  const Divider(
                    color: Colors.brown,
                    thickness: 2,
                    height: 10,
                    indent: 300,
                    endIndent: 300,
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                        ),
                        child: Row(
                          children: [
                            _buildStory(
                                'Aarav & Priya',
                                'Thanks to Bright Wedding, our love story unfolded like a dream. Our big day was perfect, filled with love and joy.',
                                'assets/images/couple.jpg',
                                52,
                                -105 // Placeholder for asset image
                            ),
                            _buildStory(
                                'Aarav & Priya',
                                'Thanks to Bright Wedding, our love story unfolded like a dream. Our big day was perfect, filled with love and joy.',
                                'assets/images/couple.jpg',
                                52,
                                -105 // Placeholder for asset image
                            ),
                            _buildStory(
                                'Aarav & Priya',
                                'Thanks to Bright Wedding, our love story unfolded like a dream. Our big day was perfect, filled with love and joy.',
                                'assets/images/couple.jpg',
                                52,
                                -105 // Placeholder for asset image
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 400),
                          child: _buildStory(
                              'Aarav & Priya',
                              'Thanks to Bright Wedding, our love story unfolded like a dream. Our big day was perfect, filled with love and joy.',
                              'assets/images/couple.jpg',
                              400,
                              -455 // Placeholder for asset image
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: _buildStory(
                              'Aarav & Priya',
                              'Thanks to Bright Wedding, our love story unfolded like a dream. Our big day was perfect, filled with love and joy.',
                              'assets/images/couple.jpg',
                              400,
                              -455 // Placeholder for asset image
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  const Text(
                    'Trusted By Millions',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 90),

                  // Add Footer here
                  Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build each story card
  Widget _buildStory(String title, String description, String imagePath,
      double heightc, double topc) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(width: 2.0),
                bottom: BorderSide(width: 2.0),
                left: BorderSide(width: 0.3),
                right: BorderSide(width: 0.3),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'More',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -45,
            left: 100,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          Positioned(
            top: topc,
            left: 145,
            child: Column(
              children: [
                Container(
                  height: heightc,
                  width: 2,
                  color: Colors.brown[200],
                ),
                Icon(Icons.circle, size: 10, color: Colors.brown),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessStoryRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
