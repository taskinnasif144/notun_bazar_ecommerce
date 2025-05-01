import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController{
  /// A global key used to uniquely identify the `Scaffold` widget and allow 
  /// access to its state. This is used to control the drawer operations 
  /// (open and close) programmatically.
  var scaffoldKey = GlobalKey<ScaffoldState>();

  /// Opens the drawer of the `Scaffold` widget associated with the `scaffoldKey`.
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  /// Closes the drawer of the `Scaffold` widget associated with the `scaffoldKey`.
  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

}