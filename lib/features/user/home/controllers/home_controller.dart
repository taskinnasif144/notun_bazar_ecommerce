import 'package:flutter_getx_template/features/user/home/models/categories_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
 
  RxDouble selectedCarousel = 0.0.obs;
  RxList<String> carouselItems = [
    "https://e-liquids.com/cdn/shop/files/pixl-duo-prefilled-pods.jpg?v=1741339324&width=1200",
    "https://e-liquids.com/cdn/shop/files/hula-legal-big-puff-device-flavours-new.jpg?v=1742221470&width=1200",
    "https://e-liquids.com/cdn/shop/files/xqs-nicotine-pouches-new.jpg?v=1743504424&width=1200",
  ].obs;
  RxList<CategoriesModel> categories = [
    CategoriesModel(title: "E-liquids", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Disposables", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Vape Coils", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Vape Tanks", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Headsets", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Hardwares", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Softwares", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
    CategoriesModel(title: "Bottles", imageUrl: "https://ext.same-assets.com/3830457462/166509041.png"),
  ].obs;
}
