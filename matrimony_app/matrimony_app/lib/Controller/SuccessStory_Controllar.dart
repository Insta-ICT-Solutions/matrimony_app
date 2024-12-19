import 'package:get/get.dart';
import '../Component/Dashboard/success_story/success_story.dart';
import '../Models/Success_Story_Model.dart';

class SuccessStoryController extends GetxController {
  // Now, successList is a list of SuccessStoryModel objects
  var successList = <SuccessStoryModel>[].obs;

  // Add a success story to the list
  void addSuccessStory(String user1Name, String user2Name, String user1Link,
      String user2Link) {
    successList.add(SuccessStoryModel(
      user1Name: user1Name,
      user2Name: user2Name,
      user1Link: user1Link,
      user2Link: user2Link,
    ));
  }

  // Remove a success story from the list
  void removeSuccessStory(int index) {
    successList.removeAt(index);
  }

  void deleteStory(SuccessStoryModel story) {
    successList.remove(story);
  }

}