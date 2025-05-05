import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';

class NotificaitonsScreen extends StatelessWidget {
  const NotificaitonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenWrapper(
        appbar: customAppBar1(title: "Notification", hasCart: false),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryLight),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                Icons.notification_add,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                "You have a new notification",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
