import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/cart/controller/cart_controller.dart';
import 'package:foodee_mobile_app/cart/widget/cart_item_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_widget/common_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 35.sp,
              title: Row(
                children: [
                  const Expanded(
                      child: CommonText(
                    title: 'My Cart',
                    fontSize: 22,
                  )),
                  InkWell(
                    onTap: Get.back,
                    child: Container(
                      height: 4.h,
                      width: 4.h,
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xffF5CAC3),
                          borderRadius: BorderRadius.circular(13)),
                      child: Image.asset(
                        'assets/icons/X.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              children: [
                const SizedBox(
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Divider(
                          color: Color(0xffF28482),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CommonText(title: 'My Order', fontSize: 10),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xffF28482),
                                child: CommonText(
                                    title: '1',
                                    color: Colors.white,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CommonText(
                                title: 'Details',
                                fontSize: 10,
                                color: Colors.black12,
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xffF5CAC3),
                                child: CommonText(
                                  title: '2',
                                  color: Colors.white60,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CommonText(
                                title: 'Payment',
                                fontSize: 10,
                                color: Colors.black12,
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xffF5CAC3),
                                child: CommonText(
                                  title: '3',
                                  color: Colors.white60,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CommonText(
                        title: 'Order',
                        fontSize: 18,
                      ),
                      InkWell(
                          onTap: controller.onClearCart,
                          child: const CommonText(
                            title: 'Clear all',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color(0xffF28482),
                          )),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: controller.cartList.length,
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CartItemWidget(
                      image: controller.cartList[index].imagePath,
                      price: controller.cartList[index].totalPrice ?? '0.0',
                      title: controller.cartList[index].name,
                      quantity: '${controller.cartList[index].quantity}',
                      onDecreaseQuantity: () =>
                          controller.onDecreaseQuantity(index),
                      onIncreaseQuantity: () =>
                          controller.onIncreaseQuantity(index)),
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            bottomNavigationBar:controller.totalCartPrice==0.00?null :Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
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
              child: InkWell(
                onTap: controller.onCheckOut,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 25),
                  decoration: BoxDecoration(
                    color: const Color(0xffF28482),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: CommonText(
                          title: 'Next Step',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                      CommonText(
                        title:
                            '\$${controller.totalCartPrice.toStringAsFixed(2)}',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
