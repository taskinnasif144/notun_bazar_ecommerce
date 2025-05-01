import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.productName});
  final String productName;

  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      appbar: customAppBar2(),
      child: Column()
    );
  }
}