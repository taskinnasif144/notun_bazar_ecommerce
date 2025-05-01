import 'package:get/get.dart';

class HomeController extends GetxController {
  RxDouble selectedCarousel = 0.0.obs;
  RxList<String> carouselItems = [
    "https://e-liquids.com/cdn/shop/files/pixl-duo-prefilled-pods.jpg?v=1741339324&width=1200",
    "https://e-liquids.com/cdn/shop/files/hula-legal-big-puff-device-flavours-new.jpg?v=1742221470&width=1200",
    "https://e-liquids.com/cdn/shop/files/xqs-nicotine-pouches-new.jpg?v=1743504424&width=1200",
  ].obs;
}
