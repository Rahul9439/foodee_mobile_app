import 'package:foodee_mobile_app/cart/view/cart_screen.dart';
import 'package:foodee_mobile_app/category/view/category_details_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../dashboard/view/dashboard_screen.dart';

var route = [
  GetPage(
    name: '/',
    title: 'DashboardScreen',
    page: () => const DashboardScreen(),
  ),
  GetPage(
    name: '/CategoryDetailsScreen',
    title: 'CategoryDetailsScreen',
    page: () => const CategoryDetailsScreen(),
  ),
  GetPage(
    name: '/CartScreen',
    title: 'CartScreen',
    page: () => const CartScreen(),
  ),
];