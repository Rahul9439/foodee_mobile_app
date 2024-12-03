import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import '../model/category_model.dart';

class HomeController extends GetxController {
  List<CategoryModel>? categoryModelList;
  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

//To get the category list data
  getCategoryList() {
    categoryModelList = [
      CategoryModel(name: 'Burger', color: 0xffFFEF92, imagePath: 'burger.png'),
      CategoryModel(
          name: 'Frice', color: 0xffF28482, imagePath: 'french_frice.png'),
      CategoryModel(name: 'Drink', color: 0xffB6D7CF, imagePath: 'drink.png'),
    ];
  }

  //Go to category details screen with category argument
  onCategory(CategoryModel category) {
    Get.toNamed('CategoryDetailsScreen',arguments: category);
  }
}
