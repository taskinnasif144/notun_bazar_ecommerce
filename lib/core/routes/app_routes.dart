part of 'app_pages.dart';

abstract class Routes {
  // Auth features routes
  static const splashScreen = '/splash';
  static const signInScreen = '/sign-in';
  static const signUpScreen = '/sign-up';
  static const verifyEmailScreen = '/verify-email';
  static const verifyOtpScreen = '/verify-otp';
  static const newPasswordScreen = '/new-password';

  // For Users

  // home feature
  static const homeScreen = '/home';
  static const bestSellingList = '/best-selling-list';
  static const categoryListScreen = '/category-list';
  static const hotDealsListScreen = '/hot-deals-list';
  static const productDetailsScreen = '/product-details';

  // cart feature
  static const cartScreen = '/cart';

  // messages feature
  static const messagesScreen = '/messages';

  // favourite features
  static const favouriteScreen = '/favourite';

  // For Sellers
}
