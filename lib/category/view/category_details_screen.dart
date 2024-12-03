import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/common_widget/common_text.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF28482),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Expanded(child: CommonText(title: 'Mr.Cheezy',color: Colors.white,fontSize: 32,)),
            Container(
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              decoration: BoxDecoration(
                  color: const Color(0xffF5CAC3),
                  borderRadius: BorderRadius.circular(13)),
              child: Image.asset('assets/icons/X.png',height: 30,width: 25,),
            )
          ],
        ),
      ),
      body: ListView(
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
                        margin: const EdgeInsets.only(bottom: 5,top: 50,left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffF7EDE2)),
                        child: const CommonText(
                          title: 'Classic Taste',
                          color: Color(0xffF28482),
                          fontWeight: FontWeight.w500,
                        ),
                      ),Container(
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
          )
        ],
      ),
    );
  }
}
