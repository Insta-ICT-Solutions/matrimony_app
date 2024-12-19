
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/SuccessStory_Controllar.dart';
import '../../../Helper/colors.dart';
import '../../AppBar/header.dart';
import 'Add_Success_story.dart'; // Import the AddSuccessStory page

class SuccessStory extends StatelessWidget {
  // Instance of SuccessStoryController to access the list
  final SuccessStoryController controller = Get.put(SuccessStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddSuccessStoryButton(),
            SizedBox(height: 16), // Add some spacing between button and list
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.successList.length,
                  itemBuilder: (context, index) {
                    final story = controller.successList[index];
                    return _buildSuccessStoryCard(story);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Button to navigate to AddSuccessStory page
  Widget _buildAddSuccessStoryButton() {
    return ElevatedButton.icon(
      onPressed: () {
        Get.to(() => AddSuccessStory());
      },
      icon: Icon(
        Icons.add,
        size: 28,
        color: Colors.white,
      ),
      label: Text(
        "Add Success Story",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
      ),
    );
  }

  // Card to display a success story
// Card to display a success story
  Widget _buildSuccessStoryCard(story) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Delete button at the top-left corner
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  // Show a confirmation dialog before deletion
                  Get.dialog(
                    AlertDialog(
                      title: Text("Delete Confirmation"),
                      content: Text("Are you sure you want to delete this story?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back(); // Close the dialog
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.deleteStory(story); // Call delete function
                            Get.back(); // Close the dialog
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildUserCard(story.user1Link, story.user1Name),
                    _buildUserCard(story.user2Link, story.user2Name),
                    _buildMarriedCard(story),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }


  // Individual user card
  Widget _buildUserCard(String imageUrl, String name) {
    return Container(
      height: 400,
      width: 280,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            child: Image.network(
              imageUrl,
              height: 320,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Married card
  Widget _buildMarriedCard(story) {
    return Container(
      height: 400,
      width: 350,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade200, Colors.yellow.shade200],
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
            padding: EdgeInsets.all(8),
            child: Text(
              "Just Married!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            ),
          ),
          SizedBox(height: 6),
          CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(story.user1Link),
          ),
          SizedBox(height: 6),
          Icon(Icons.favorite, color: Colors.red, size: 20),
          SizedBox(height: 6),
          CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(story.user2Link),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "${story.user1Name} & ${story.user2Name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
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
              padding: EdgeInsets.symmetric(vertical: 12.0),
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
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


