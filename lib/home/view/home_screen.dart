import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widget/common_text.dart';
import '../controller/home_controller.dart';
import '../model/category_model.dart';
import '../widget/category_menu_widget.dart';
import '../widget/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                          color:
                              Color.fromRGBO(214, 211, 192, 0.4000000059604645),
                          offset: Offset(0, 8),
                          blurRadius: 20)
                    ],
                    color: const Color(0xffFFFFF2),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        margin: const EdgeInsets.only(right: 10),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset('assets/image/image 3.png'),
                      ),
                      const Expanded(
                        child: CommonText(
                          title: 'Welcome back, Pin!\nHow Hungry are you?',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Unbounded',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: GoogleFonts.getFont('Unbounded',
                                fontWeight: FontWeight.w200),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xffF28482),
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset('assets/image/Filter.png'),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 230,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CommonText(
                            title: "Today's Menu",
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 190,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const MenuWidget(
                                title: 'Free Donut!',
                                subTitle: 'For orders over \$20',
                                image:
                                    '3d-casual-life-donut-with-pink-icing 1.png',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryModelList?.length,
                    itemBuilder: (context, index) {
                      CategoryModel category =
                          controller.categoryModelList![index];
                      return CategoryMenuWidget(
                        heading: category.name,
                        colorCode: category.color,
                        image: category.imagePath,
                        onTap:()=>controller.onCategory(category)
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15,top: 20),
                  child: CommonText(
                    title: "Best offers 💕",
                    fontSize: 24,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                          color:
                              Color.fromRGBO(242, 204, 143, 0.4000000059604645),
                          offset: Offset(0, 8),
                          blurRadius: 32)
                    ],
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: 88,
                          height: 88,
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset('assets/image/french_dog.png')),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            title: 'Frenchdog',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonText(
                            title: 'Tasty&Spicy 🌶🌶🌶',
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
