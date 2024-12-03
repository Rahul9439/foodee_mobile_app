import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/common_widget/common_text.dart';
import 'package:foodee_mobile_app/dashboard/controller/dashboard_controller.dart';
import 'package:foodee_mobile_app/dashboard/model/dashboard_model.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../widget/dashboard_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: controller.dashboardScreensList[controller.selectedIndex],
            floatingActionButton: Container(
                margin: const EdgeInsets.only(left: 30),
                padding: const EdgeInsets.all(20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(controller.dashboardList.length, (index) {
                      DashboardModel dashboard =
                          controller.dashboardList[index];
                      return DashboardWidget(
                        icon: dashboard.icon,
                        name: dashboard.name,
                        color: index != controller.selectedIndex
                            ? Colors.black54
                            : const Color(0xffF28482),
                        onTap: () => controller.onChange(index),
                      );
                    })
                  ],
                )),
          );
        });
  }
}
