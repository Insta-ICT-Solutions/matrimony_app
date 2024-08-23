import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var selectedFile = Rxn<PlatformFile>();
  var selectedFileName = "Update from Device".obs;
  var selectedFileUnicode = ''.obs;

  final ImagePicker _picker = ImagePicker();

  // Existing method for picking files
  Future<void> pickFile(FileType fileType, bool allowMultiple) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: allowMultiple,
      );

      if (result != null) {
        selectedFile.value = result.files.first;
        selectedFileName.value = selectedFile.value!.name;
      } else {
        print('File selection canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }
}





