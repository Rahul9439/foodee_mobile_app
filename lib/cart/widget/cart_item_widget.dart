import 'package:flutter/material.dart';

import '../../common_widget/common_text.dart';

class CartItemWidget extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final String quantity;
  final Function() onDecreaseQuantity;
  final Function() onIncreaseQuantity;
  const CartItemWidget(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      required this.quantity,
      required this.onDecreaseQuantity,
      required this.onIncreaseQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(242, 204, 143, 0.4000000059604645),
              offset: Offset(0, 8),
              blurRadius: 32)
        ],
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Image.asset(
            'assets/image/$image',
            height: 50,
            width: 50,
          ),
           Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      title: title,
                      fontSize: 11,
                    ),
                    CommonText(
                      title: '\$${double.parse(price).toStringAsFixed(2)}',
                      fontSize: 10,
                      color: const Color(0xffF28482),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onDecreaseQuantity,
                child: const CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xffF7EDE2),
                  child: Icon(Icons.remove, size: 15, color: Color(0xffF28482)),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(title: quantity,fontSize: 10,),
              ),
              InkWell(
                onTap: onIncreaseQuantity,
                child: const CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xffF28482),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
