
import 'package:get/get.dart';
import '../../home/model/category_model.dart';

class CartController extends GetxController {

  List<CategoryModel> cartList = [];
  int quantity = 1;

  double totalPrice= 0.00;

  @override
  void onInit() {
    super.onInit();
  }

//To increase item qty
  void onIncreaseQuantity(int index) {
    quantity = cartList[index].quantity!;
    quantity++;
    totalPrice = double.parse(cartList[index].price!) * quantity;
    cartList[index] = CategoryModel(
        name: cartList[index].name,
        color: cartList[index].color,
        imagePath: cartList[index].imagePath,
        quantity: quantity,
        price: cartList[index].price,
        totalPrice: '$totalPrice'
    );
    update();
  }

  //To decrease item qty
  void onDecreaseQuantity(int index) {
    quantity = cartList[index].quantity!;
    if (quantity > 1) {
      quantity--;
      totalPrice = double.parse(cartList[index].price!) * quantity;
      cartList[index] = CategoryModel(
          name: cartList[index].name,
          color: cartList[index].color,
          imagePath: cartList[index].imagePath,
          quantity: quantity,
          price: cartList[index].price,
          totalPrice: '$totalPrice');
    } else {
      cartList.removeAt(index);
    }
    update();
  }

  void onClearCart() {
    cartList.clear();
    update();
  }
}
