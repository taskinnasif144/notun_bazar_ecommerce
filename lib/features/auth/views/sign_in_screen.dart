import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GetColor color = GetColor();
  final GetTextStyle style = GetTextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: Get.width,),
        Text("Sign in", style: style.getHeading(),),
      ],
    )));
  } 
}
