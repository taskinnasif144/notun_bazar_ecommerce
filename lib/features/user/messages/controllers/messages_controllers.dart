import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MessagesControllers extends GetxController {
  TextEditingController chatSearchController =
      TextEditingController(); //responsible for recording texts that will be used to search the user
  TextEditingController chatController =
      TextEditingController(); //responsible for record texts that will be sent

  Rx<File?> selectedImage = Rx<File?>(null); // Holds the selected image, initially set to null

  Future pickImageFromGalary() async {
     final ImagePicker picker = ImagePicker();
     XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
     if(pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
     } 
     
  }
}
