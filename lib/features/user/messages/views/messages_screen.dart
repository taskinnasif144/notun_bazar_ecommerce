import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/user/messages/bindings/messages_bindings.dart';
import 'package:flutter_getx_template/features/user/messages/controllers/messages_controllers.dart';
import 'package:flutter_getx_template/features/user/messages/views/message_details_screen.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});
  final MessagesControllers messageController = Get.find<MessagesControllers>();
  @override
  Widget build(BuildContext context) {
    return screenWrapper(
      appbar: customAppBar1(hasBackButton: false, title: "Messages"),
      child: Column(
        spacing: 20,
        children: [
          CustomInputField(
            controller: messageController.chatSearchController,
            hintText: "Search...",
            borderRadius: 100,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(children: List.generate(10, (index) => ChatCard(
                isMyLastText: index %2 == 0,
                lastMsg: "Hello",
                name: "Dewan Nasif",
              ))),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.name,
    required this.isMyLastText,
    required this.lastMsg,
    this.imageUrl,
  });
  final bool isMyLastText; // if true then "you:" will be prefixed
  final String lastMsg;
  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> MessageDetailsScreen(), binding: MessagesBindings()),
      child: ListTile(
        // Profile picture of the users
        leading: CircleAvatar(
          radius: 20,
          child: imageRender(
            url: "https://thispersondoesnotexist.com/",
            width: 46,
            height: 46,
            borderRadius: 100,
          ),
        ),
        // name of the user
        title: Text(name, style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text(
          "${isMyLastText? "You:" : ""} $lastMsg",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
