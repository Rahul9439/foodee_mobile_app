import 'dart:convert';

import 'package:foodee_mobile_app/cart/controller/cart_controller.dart';
import 'package:get/get.dart';
import '../../home/model/category_model.dart';

class CategoryDetailsController extends GetxController {
  int quantity = 1;
  double totalPrice = 0.00;
  List<CategoryModel>? categoryDetailsLList;
  CategoryModel? categoryModel;
  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

//To get the category list data
  getCategoryList() {
    categoryDetailsLList = [
      CategoryModel(
        name: 'Chedder',
        color: 0xffFFFFF2,
        imagePath: 'chedder.png',
        quantity: 1,
        price: '0.79',
        totalPrice: '0.79',
      ),
      CategoryModel(
          name: 'Bacon',
          color: 0xffFFFFF2,
          imagePath: 'bacon.png',
          quantity: 1,
          price: '0.59',
          totalPrice: '0.59'),
      CategoryModel(
          name: 'Onion',
          color: 0xffFFFFF2,
          quantity: 1,
          imagePath: 'onion.png',
          price: '0.29',
          totalPrice: '0.29'),
    ];
  }

  //Go to category details screen with category argument
  onCategory(CategoryModel category) {
    categoryModel = category;
    update();
  }

  //To increase item qty
  void onIncreaseQuantity() {
    quantity++;
    totalPrice = double.parse(categoryModel!.price!) * quantity;
    categoryModel = CategoryModel(
        name: categoryModel!.name,
        color: categoryModel!.color,
        imagePath: categoryModel!.imagePath,
        quantity: quantity,
        price: categoryModel!.price,
        totalPrice: '$totalPrice');
    update();
  }

  //To decrease item qty
  void onDecreaseQuantity() {
    if (quantity > 1) {
      quantity--;
      totalPrice = double.parse(categoryModel!.price!) * quantity;
      categoryModel = CategoryModel(
          name: categoryModel!.name,
          color: categoryModel!.color,
          imagePath: categoryModel!.imagePath,
          quantity: quantity,
          price: categoryModel!.price,
          totalPrice: '$totalPrice');
      update();
    }
  }

  onAddToCart() {
    if(Get.isRegistered<CartController>()){
      Get.find<CartController>().cartList.add(categoryModel!);
      Get.find<CartController>().calculateSum();
    }
    Get.toNamed('CartScreen');
    categoryModel = null;
    quantity = 1;
    update();
  }
}
