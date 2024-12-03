import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    return Padding(
      padding:  EdgeInsets.only(left: 10.px, right: 5.px, bottom: 20.px, top: 25.px),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          width: 110.px,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.only(bottom: 15),
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
                  height: 70.px,
                  width: 70.px,
                ),
              ),
              CommonText(title: title,fontSize: 12,fontWeight: FontWeight.w300,),
              CommonText(title: '+\$$price',fontSize: 12,fontWeight: FontWeight.w300,),
            ],
          ),
        ),
      ),
    );
  }
}
