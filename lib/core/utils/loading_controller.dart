import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  static LoadingController get to => Get.find();
  RxBool isLoading = false.obs;

  void showLoading() {
   
     isLoading.value = true;
      debugPrint("========>>> loading started");
  }
  void hideLoading(){
    debugPrint("========>>> loading stopped");
     isLoading.value = false;
  }
}
