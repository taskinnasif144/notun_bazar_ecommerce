import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/bottom_navigation.dart';
import 'package:flutter_getx_template/features/user/search/views/search_screen.dart';
import 'package:flutter_getx_template/features/user/home/views/home_screen.dart';
import 'package:flutter_getx_template/features/user/messages/views/messages_screen.dart';
import 'package:flutter_getx_template/features/user/profile/views/profile_screen.dart';
import 'package:get/state_manager.dart';

class MainUserScreen extends StatelessWidget {
  MainUserScreen({super.key});

  // The following controller is responsible for smooth transition among pages
  final PageController pageController = PageController();
  // The following variable is to keep track of the pages through index
  final RxInt _indedx = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // Previously initialized controller
        controller: pageController,
        // The following function is fired on page change and passes the index of the page in params
        onPageChanged: (value) {
          _indedx.value = value; // updating the index with page changes.
        },
        // List of pages that needs to be transitioned
        children: [
          HomeScreen(),
          SearchScreen(),
          MessagesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigation(
        menuIndex: _indedx.value,
        onChanged: (index) {
          // the index is passed when a navigation button is pressed and 
          //later is used to update the pageview controller.
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceIn,
          );
        },
      ),),
    );
  }
}
