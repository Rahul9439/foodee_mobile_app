import 'package:flutter/material.dart';

import '../../common_widget/common_text.dart';

class DashboardWidget extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String name;
  final Color color;
  const DashboardWidget(
      {super.key, required this.onTap, required this.icon, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/$icon',
            height: 30,
            width: 30,
            color: color,
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
