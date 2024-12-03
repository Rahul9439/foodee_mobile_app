import 'package:flutter/material.dart';

import '../../common_widget/common_text.dart';

class CategoryDetailMenuWidget extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final int colorCode;
  final Function() onTap;
  const CategoryDetailMenuWidget(
      {super.key,
      required this.image,
      required this.colorCode,
      required this.title,
      required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 110,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.only(bottom: 15),
        margin: const EdgeInsets.only(left: 10, right: 5, bottom: 20, top: 25),
        decoration: BoxDecoration(
            color: Color(colorCode),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(242, 204, 143, 0.4000000059604645),
                  offset: Offset(0, 8),
                  blurRadius: 20)
            ],
            borderRadius: BorderRadius.circular(28)),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/image/$image',
                height: 80,
                width: 80,
              ),
            ),
            CommonText(title: title,fontSize: 12,fontWeight: FontWeight.w300,),
            CommonText(title: '+\$$price',fontSize: 12,fontWeight: FontWeight.w300,),
          ],
        ),
      ),
    );
  }
}
