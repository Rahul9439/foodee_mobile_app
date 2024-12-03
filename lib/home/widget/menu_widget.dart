import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/common_widget/common_text.dart';

class MenuWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const MenuWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 400,
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: const Color(0xff84A59D),
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(129, 178, 154, 0.4000000059604645),
                      offset: Offset(0, 8),
                      blurRadius: 12)
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        title: title,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      CommonText(
                        title: subTitle,
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/image/$image',
                height: 140,
                width: 140,
              ))
        ],
      ),
    );
  }
}
