import 'package:flutter/material.dart';
import 'package:foodee_mobile_app/home/view/home_screen.dart';
import 'package:get/get.dart';

import '../model/dashboard_model.dart';

class DashboardController extends GetxController{
  late List<DashboardModel> dashboardList;
  late List<Widget> dashboardScreensList;
  int selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    getDashboardData();
    
  }
  // To get the dashboard data
  getDashboardData(){
    dashboardList = [
      DashboardModel(name: 'Location', icon: 'Poi.png'),
      DashboardModel(name: 'Home', icon: 'Home.png'),
      DashboardModel(name: 'My Cart', icon: 'Bag.png'),
      DashboardModel(name: 'Me', icon: 'User.png'),
    ];
    dashboardScreensList = [
      const Center(child: Text('Location Screen')),
      const HomeScreen(),
      const Center(child: Text('Cart Screen')),
      const Center(child: Text('User Screen')),
    ];
  }


  onChange(int index) {
    selectedIndex = index;
    update();
  }
}