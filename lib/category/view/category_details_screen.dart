import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/category/controller/category_details_controller.dart';
import 'package:foodee_mobile_app/common_widget/common_text.dart';
import 'package:get/get.dart';

import '../../home/model/category_model.dart';
import '../widget/category_detail_menu_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailsController>(
        init: CategoryDetailsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffF28482),
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  const Expanded(
                      child: CommonText(
                    title: 'Mr.Cheezy',
                    color: Colors.white,
                    fontSize: 32,
                  )),
                  InkWell(
                    onTap: Get.back,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xffF5CAC3),
                          borderRadius: BorderRadius.circular(13)),
                      child: Image.asset(
                        'assets/icons/X.png',
                        height: 30,
                        width: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                SizedBox(
                  height: 340,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 320,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            color: Color(0xffF28482),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/image/3d-casual-life-burger-slant 1.png',
                          width: 340,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(
                                  bottom: 5, top: 50, left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffF7EDE2)),
                              child: const CommonText(
                                title: 'Classic Taste',
                                color: Color(0xffF28482),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff84A59D)),
                              child: const CommonText(
                                title: 'Bestseller',
                                color: Color(0xffF7EDE2),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: CommonText(
                    title: 'Add More Flavor 🤩',
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryDetailsLList?.length,
                    itemBuilder: (context, index) {
                      CategoryModel category =
                          controller.categoryDetailsLList![index];
                      return CategoryDetailMenuWidget(
                        title: category.name,
                        colorCode: category.color,
                        image: category.imagePath,
                        price: category.price ?? '0.00',
                        onTap: () => controller.onCategory(category),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: CommonText(
                        title: 'Nutrition facts',
                        fontSize: 24,
                      )),
                      CommonText(
                        title: '650 Cal',
                        fontSize: 24,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              CommonText(
                                title: '35 g',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              CommonText(
                                  title: 'Total Fat(45% Dv)',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              CommonText(
                                title: '43 g',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              CommonText(
                                  title: 'Total Carbs (16% DV)',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              CommonText(
                                title: '36 g',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              CommonText(
                                  title: 'Protein',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 20),
                  child: CommonText(
                    title: 'Description',
                    fontSize: 24,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CommonText(
                    title:
                        'Each Mr.Cheezy® with Cheese Bacon burger features thick-cut applewood smoked bacon atop a ¼ lb.',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: controller.categoryModel ==null
                ? null
                : Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.all(8),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 8),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: const Color(0xffF28482))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: controller.onDecreaseQuantity,
                                  child: const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xffF7EDE2),
                                    child: Icon(Icons.remove,
                                        color: Color(0xffF28482)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: CommonText(
                                      title: '${controller.categoryModel?.quantity}'),
                                ),
                                InkWell(
                                  onTap: controller.onIncreaseQuantity,
                                  child: const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xffF28482),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: controller.onAddToCart,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xffF28482),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CommonText(
                                    title: 'Add to Cart',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  CommonText(
                                    title: '\$${controller.categoryModel?.totalPrice}',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}
