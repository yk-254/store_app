import 'package:get/get.dart';
import 'package:store_app/app/data/models/user.dart';
import 'package:store_app/app/modules/home/views/home_view.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  void registering(data) {
    user = User(name: data['name'], profilePhoto: 'assets/images/pers.jpg', age: data['age'], location: 'kerman , Rafsanjan', phone: data['name'], gender: data['gender'], password: data['pass']);
    Get.offAll(HomeView());
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
