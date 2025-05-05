import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/product_card.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/loggers/debug_logger.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/user/search/controllers/search_controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController searchController =
      Get.find<SearchScreenController>();
  @override
  Widget build(BuildContext context) {
    return screenWrapper(
      scaffoldKey: Get.find<SidebarController>().scaffoldFavouriteKey,
      appbar: customAppBar1(component: typeAheadComponent(), hasBackButton: false),
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 12.0, // Spacing between rows
          childAspectRatio: 0.375, // Aspect ratio of each grid item
        ),
        itemCount: searchController.foundProducts.length,// Number of items
        itemBuilder: (context, index) {
          final product = searchController.foundProducts[index];
          return  ProductCard(model: product, addToCart: (){}); 
        },
      ),
    );
  }

  // T
  Widget typeAheadComponent() {
    return TypeAheadField<String>(
      suggestionsCallback: (search) => searchController.findSuggestion(search),
      builder: (context, controller, focusNode) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.primaryLight, width: 1))
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: true,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              isDense: true,
              border: InputBorder.none,
              hintText: "Search..",
              labelText: '',
            ),
          ),
        );
      },
      hideOnEmpty: true,

      itemBuilder: (context, item) {
        return ListTile(
          title: Text(item, style: Theme.of(context).textTheme.bodyMedium,),
        );
      },
      onSelected: (item) {
        searchController.searchController.text = item;
        printMsg(searchController.searchController.text);
      },
    );
  }
}
