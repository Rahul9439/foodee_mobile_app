import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/common_widget/common_text.dart';

class CategoryMenuWidget extends StatelessWidget {
  final String heading;
  final String image;
  final int colorCode;
  final Function() onTap;
  const CategoryMenuWidget(
      {super.key, required this.heading, required this.image, required this.colorCode, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: 115,
        height: 12,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 25),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                ),
                child: CommonText(title: heading),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/image/$image',
                  height: 100,
                  width: 100,
                ))
          ],
        ),
      ),
    );
  }
}
