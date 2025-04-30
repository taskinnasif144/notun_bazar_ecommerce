import 'package:flutter_getx_template/features/auth/bindings/auth_bindings.dart';
import 'package:flutter_getx_template/features/auth/views/new_password_screen.dart';
import 'package:flutter_getx_template/features/auth/views/sign_in_screen.dart';
import 'package:flutter_getx_template/features/auth/views/sign_up_screen.dart';
import 'package:flutter_getx_template/features/auth/views/splash_screen.dart';
import 'package:flutter_getx_template/features/auth/views/verify_email_screen.dart';
import 'package:flutter_getx_template/features/auth/views/verify_otp_screen.dart';
import 'package:flutter_getx_template/features/notificaitons/Views/notificaitons_screen.dart';
import 'package:flutter_getx_template/features/notificaitons/bindings/notification_bindings.dart';
import 'package:flutter_getx_template/features/user/cart/bindings/cart_bindings.dart';
import 'package:flutter_getx_template/features/user/cart/views/cart_screen.dart';
import 'package:flutter_getx_template/features/user/favourite/bindings/favourites_bindings.dart';
import 'package:flutter_getx_template/features/user/favourite/views/favourite_screen.dart';
import 'package:flutter_getx_template/features/user/home/bindings/home_binding.dart';
import 'package:flutter_getx_template/features/user/home/views/best_selling_list_screen.dart';
import 'package:flutter_getx_template/features/user/home/views/category_list_screen.dart';
import 'package:flutter_getx_template/features/user/home/views/home_screen.dart';
import 'package:flutter_getx_template/features/user/home/views/hot_deals_list_screen.dart';
import 'package:flutter_getx_template/features/user/home/views/product_details_screen.dart';
import 'package:flutter_getx_template/features/user/main_user_screen.dart';
import 'package:flutter_getx_template/features/user/messages/bindings/messages_bindings.dart';
import 'package:flutter_getx_template/features/user/messages/views/messages_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splashScreen;

  static final routes = [
    // Auth Features Pages
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.verifyOtpScreen,
      page: () => VerifyOtpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.newPasswordScreen,
      page: () => NewPasswordScreen(),
      binding: AuthBindings(),
    ),

    // notification feature
    GetPage(
      name: Routes.notificationScreen,
      page: () => NotificaitonsScreen(),
      binding: NotificationBindings(),
    ),

    // For User
     GetPage(
      name: Routes.mainUserPage,
      page: () => MainUserScreen(),
      binding: HomeBinding(),
    ),

    // home features
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.bestSellingList,
      page: () => BestSellingListScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.categoryListScreen,
      page: () => CategoryListScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.hotDealsListScreen,
      page: () => HotDealsListScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.productDetailsScreen,
      page: () => ProductDetailsScreen(),
      binding: HomeBinding(),
    ),

    // cart features
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      binding: CartBindings(),
    ),

    // message features
    GetPage(
      name: Routes.messagesScreen,
      page: () => MessagesScreen(),
      binding: MessagesBindings(),
    ),

    // favourite features
    GetPage(
      name: Routes.favouriteScreen,
      page: () => FavouriteScreen(),
      binding: FavouritesBindings(),
    ),

    // For Seller
  ];
}
