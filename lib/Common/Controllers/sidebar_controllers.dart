import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  /// A global key used to uniquely identify the `Scaffold` widget and allow
  /// access to its state. This is used to control the drawer operations
  /// (open and close) programmatically.
  var scaffoldHomeKey = GlobalKey<ScaffoldState>();
  var scaffoldFavouriteKey = GlobalKey<ScaffoldState>();

  /// Opens the drawer of the `Scaffold` widget associated with the `scaffoldKey`.
  void openDrawer() {
    // At any given time, only one scaffold key state will hold a value, while the others will be null.
    // The active scaffold key corresponds to the screen the user is currently interacting with.
    if (scaffoldFavouriteKey.currentState != null) {
      scaffoldFavouriteKey.currentState!.openDrawer();
    }

    if (scaffoldHomeKey.currentState != null) {
      scaffoldHomeKey.currentState!.openDrawer();
    }
  }
}
