import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../../common_widget/common_text.dart';

class DashboardWidget extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String name;
  final String cartQty;
  final Color color;
  const DashboardWidget(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.name,
      required this.color,
      required this.cartQty});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -4, end: 0),
            badgeContent: CommonText(
              title: cartQty,
              fontSize: 8,
              color: Colors.white,
            ),
            badgeStyle: const badges.BadgeStyle(badgeColor: Color(0xffF28482)),
            showBadge: cartQty.isNotEmpty && cartQty != 'null' ? true : false,
            child: Image.asset(
              'assets/icons/$icon',
              height: 30,
              width: 30,
              color: color,
            ),
          ),
          CommonText(
            title: name,
            fontSize: 10,
            color: color,
          ),
        ],
      ),
    );
  }
}
