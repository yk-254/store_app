import 'package:get/get.dart';
import 'package:store_app/app/data/models/vars.dart';

class StoreController extends GetxController {
  //TODO: Implement StoreController

  List selers = [
    {
      "name": "Ali Bagheri",
      "photo": "5",
      "rate": 5,
    },
    {
      "name": "Homa Saadat",
      "photo": "per2",
      "rate": 4,
    },
    {
      "name": "Amir Sadegi",
      "photo": "4",
      "rate": 4,
    },
  ];
  var products = <dynamic>[
    {"name": "clock", "price": 276 .obs, "photo": 'clock1', "orders": 0.obs},
    {"name": "headPhone", "price": 592.obs, "photo": 'head', "orders": 0.obs},
    {"name": "shoe", "price": 856.obs, "photo": 'sho', "orders": 0.obs},
    {"name": "glasses", "price": 741.obs, "photo": 'glass', "orders": 0.obs},
    {"name": "T-shirt", "price": 287.obs, "photo": 'prod', "orders": 0.obs}
  ];

  void addProduct(index) {
    products.elementAt(index)['orders']++;
    total.value +=  (products.elementAt(index)['price'].value) as int;
    if (!shopList.contains(products.elementAt(index))) {
      shopList.add(products.elementAt(index));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
