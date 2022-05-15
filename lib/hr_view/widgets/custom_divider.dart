import 'package:flutter/material.dart';

import '../value/colors.dart';
import '../value/sizes.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({
    this.width = Sizes.WIDTH_80,
    this.height = Sizes.HEIGHT_1,
    this.color = AppColors.white,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
