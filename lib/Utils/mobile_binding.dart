import 'package:foodee_mobile_app/cart/controller/cart_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(CartController(), permanent: true);
  }
}
