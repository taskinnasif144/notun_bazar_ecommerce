import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/user/messages/controllers/messages_controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageDetailsScreen extends StatelessWidget {
  MessageDetailsScreen({super.key});
  final MessagesControllers messagesController =
      Get.find<MessagesControllers>();
  @override
  Widget build(BuildContext context) {
    return screenWrapper(
      appbar: customAppBar1(title: "Dewan Nasif"),
      child: Column(
        spacing: 13,
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              children: List.generate(
                25,
                (index) => MessageBox(
                  isMe: index % 2 == 0,
                  message: "Happy Birthday!!",
                ),
              ),
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Flexible(
                child: CustomInputField(
                  controller: messagesController.chatController,
                  hintText: "Write message...",
                ),
              ),
              GestureDetector(
                onTap: messagesController.pickImageFromGalary,
                child: Transform.rotate(
                  angle: -45,
                  child: Icon(Icons.attachment),
                ),
              ),
              Icon(Icons.send),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.isMe,
    required this.message,
    this.imageUrl,
  });
  final bool isMe;
  final String? imageUrl;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        // to set alignment based on recieved or sent
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 12,
        children: [
          if (!isMe)
            // image of the sender
            CircleAvatar(
              radius: 15,
              child: imageRender(
                url: "https://thispersondoesnotexist.com/",
                width: 50,
                height: 50,
                borderRadius: 100,
              ),
            ),
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,

            children: [
              Text(TimeOfDay.fromDateTime(DateTime.now()).format(context)),
              // the wrapper for the text
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth: Get.width * 0.65),
                decoration: BoxDecoration(
                  color:
                      isMe
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(isMe ? 24 : 0),
                    bottomRight: Radius.circular(isMe ? 0 : 24),
                  ),
                ),
                child: Flexible(
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isMe ? Colors.white : AppColors.dark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
