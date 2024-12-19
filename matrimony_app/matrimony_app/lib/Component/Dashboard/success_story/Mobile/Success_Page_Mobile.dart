// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../Controller/SuccessStory_Controllar.dart';
// import '../../../../Helper/colors.dart';
// import '../../../AppBar/header.dart';
// import '../Add_Success_story.dart';
// import 'Add_Success_mobile.dart';
//
//
// class SuccessMobile extends StatelessWidget {
//   // Instance of SuccessStoryController to access the list
//   final SuccessStoryController controller = Get.put(SuccessStoryController());
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size for responsiveness
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: Header(),
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildAddSuccessStoryButton(screenWidth),
//             SizedBox(height: screenWidth * 0.04), // Add some spacing between button and list
//             Expanded(
//               child: Obx(() {
//                 return ListView.builder(
//                   itemCount: controller.successList.length,
//                   itemBuilder: (context, index) {
//                     final story = controller.successList[index];
//                     return _buildSuccessStoryCard(story, screenWidth);
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Button to navigate to AddSuccessStory page
//   Widget _buildAddSuccessStoryButton(double screenWidth) {
//     return ElevatedButton.icon(
//       onPressed: () {
//         Get.to(() => AddSuccessStoryMobile());
//       },
//       icon: Icon(
//         Icons.add,
//         size: screenWidth * 0.07, // Adjust icon size based on screen width
//         color: Colors.white,
//       ),
//       label: Text(
//         "Add Success Story",
//         style: TextStyle(
//           fontSize: screenWidth * 0.04, // Adjust font size based on screen width
//           fontWeight: FontWeight.bold,
//           color: Colors.pink,
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.deepPurple,
//         padding: EdgeInsets.symmetric(
//             vertical: screenWidth * 0.04, horizontal: screenWidth * 0.08),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         elevation: 5,
//       ),
//     );
//   }
//
//   // Card to display a success story
//   Widget _buildSuccessStoryCard(story, double screenWidth) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04),
//         child: Stack(
//           children: [
//             // Delete button at the top-right corner
//             Positioned(
//               top: 0,
//               right: 0,
//               child: IconButton(
//                 onPressed: () {
//                   // Show a confirmation dialog before deletion
//                   Get.dialog(
//                     AlertDialog(
//                       title: Text("Delete Confirmation"),
//                       content: Text("Are you sure you want to delete this story?"),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Get.back(); // Close the dialog
//                           },
//                           child: Text("Cancel"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             controller.deleteStory(story); // Call delete function
//                             Get.back(); // Close the dialog
//                           },
//                           child: Text(
//                             "Delete",
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 icon: Icon(Icons.delete, color: Colors.red),
//                 tooltip: "Delete Story",
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildUserCard(story.user1Link, story.user1Name, screenWidth),
//                     _buildUserCard(story.user2Link, story.user2Name, screenWidth),
//                     _buildMarriedCard(story, screenWidth),
//                   ],
//                 ),
//                 SizedBox(height: screenWidth * 0.02),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Individual user card
//   Widget _buildUserCard(String imageUrl, String name, double screenWidth) {
//     return Container(
//       height: screenWidth * 0.75, // Adjust height based on screen width
//       width: screenWidth * 0.6, // Adjust width based on screen width
//       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//             child: Image.network(
//               imageUrl,
//               height: screenWidth * 0.55, // Adjust image height based on screen width
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(screenWidth * 0.02),
//             child: Text(
//               name,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.05, // Adjust font size based on screen width
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Married card
//   Widget _buildMarriedCard(story, double screenWidth) {
//     return Container(
//       height: screenWidth * 0.75, // Adjust height based on screen width
//       width: screenWidth * 0.65, // Adjust width based on screen width
//       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.orange.shade200, Colors.yellow.shade200],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 12,
//             offset: Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.orange,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//             ),
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(screenWidth * 0.02),
//             child: Text(
//               "Just Married!",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.05, // Adjust font size based on screen width
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'DancingScript',
//               ),
//             ),
//           ),
//           SizedBox(height: screenWidth * 0.02),
//           CircleAvatar(
//             radius: screenWidth * 0.12, // Adjust avatar radius based on screen width
//             backgroundImage: NetworkImage(story.user1Link),
//           ),
//           SizedBox(height: screenWidth * 0.02),
//           Icon(Icons.favorite, color: Colors.red, size: screenWidth * 0.05),
//           SizedBox(height: screenWidth * 0.02),
//           CircleAvatar(
//             radius: screenWidth * 0.12, // Adjust avatar radius based on screen width
//             backgroundImage: NetworkImage(story.user2Link),
//           ),
//           SizedBox(height: screenWidth * 0.02),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//             child: Text(
//               "${story.user1Name} & ${story.user2Name}",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.04, // Adjust font size based on screen width
//                 color: Colors.orange.shade700,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'DancingScript',
//               ),
//             ),
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () {
//               // Navigate to their journey or details
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.orange,
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
//               ),
//               child: Text(
//                 'View Their Journey',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: screenWidth * 0.04,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/SuccessStory_Controllar.dart';
import '../../../../Helper/colors.dart';
import '../../../AppBar/header.dart';
import '../Add_Success_story.dart';
import 'Add_Success_mobile.dart';

class SuccessMobile extends StatelessWidget {
  final SuccessStoryController controller = Get.put(SuccessStoryController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddSuccessStoryButton(screenWidth),
            SizedBox(height: screenWidth * 0.05),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.successList.length,
                  itemBuilder: (context, index) {
                    final story = controller.successList[index];
                    return _buildSuccessStoryCard(story, screenWidth);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddSuccessStoryButton(double screenWidth) {
    return ElevatedButton.icon(
      onPressed: () {
        Get.to(() => AddSuccessStoryMobile());
      },
      icon: Icon(
        Icons.add,
        size: screenWidth * 0.07,
        color: Colors.white,
      ),
      label: Text(
        "Add Success Story",
        style: TextStyle(
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purpleAccent,
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04, horizontal: screenWidth * 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 12,
      ),
    );
  }

  Widget _buildSuccessStoryCard(story, double screenWidth) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text("Delete Confirmation"),
                      content: Text("Are you sure you want to delete this story?"),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.deleteStory(story);
                            Get.back();
                          },
                          child: Text("Delete", style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red),
                tooltip: "Delete Story",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildUserCard(story.user1Link, story.user1Name, screenWidth),
                    _buildUserCard(story.user2Link, story.user2Name, screenWidth),
                  ],
                ),
                Center(child: _buildMarriedCard(story, screenWidth)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(String imageUrl, String name, double screenWidth) {
    return Container(
      height: screenWidth * 0.35,
      width: screenWidth * 0.35,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMarriedCard(story, double screenWidth) {
    return Container(
      height: screenWidth * 1.25,
      width: screenWidth * 0.7,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade400, Colors.orange.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Text(
              "Just Married!",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          CircleAvatar(
            radius: screenWidth * 0.15,
            backgroundImage: NetworkImage(story.user1Link),
          ),
          SizedBox(height: screenWidth * 0.02),
          Icon(Icons.favorite, color: Colors.red, size: screenWidth * 0.06),
          SizedBox(height: screenWidth * 0.02),
          CircleAvatar(
            radius: screenWidth * 0.15,
            backgroundImage: NetworkImage(story.user2Link),
          ),
          SizedBox(height: screenWidth * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              "${story.user1Name} & ${story.user2Name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.orange.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Navigate to their journey or details
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: Text(
                'View Their Journey',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

