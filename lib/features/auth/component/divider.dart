import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';

class ORDivider extends StatelessWidget {
   ORDivider({super.key});
  final GetTextStyle style = GetTextStyle();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Or", style: style.getBody3()),
        ),
        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }
}
