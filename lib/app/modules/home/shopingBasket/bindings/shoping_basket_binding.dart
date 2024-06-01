import 'package:get/get.dart';

import '../controllers/shoping_basket_controller.dart';

class ShopingBasketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopingBasketController>(
      () => ShopingBasketController(),
    );
  }
}
