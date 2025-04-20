import 'package:flutter_getx_template/features/user/home/views/category_list_screen.dart';
import 'package:flutter_getx_template/features/user/home/views/home_screen.dart';
import 'package:get/get.dart';

import '../../features/home/bindings/home_binding.dart';
import '../../features/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
