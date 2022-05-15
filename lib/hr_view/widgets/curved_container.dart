import 'package:flutter/material.dart';

import '../layout/adaptive.dart';
import '../value/colors.dart';
import '../value/sizes.dart';

class CurvedContainer extends StatelessWidget {
  CurvedContainer({
    this.height,
    this.backgroundColor = AppColors.white,
    this.borderRadius,
    this.decoration,
    required this.child,
    this.margin,
    this.topLeftRadius = Sizes.RADIUS_0,
    this.topRightRadius = Sizes.RADIUS_0,
    this.bottomRightRadius = Sizes.RADIUS_0,
    this.bottomLeftRadius = Sizes.RADIUS_0,
    this.boxShadow,
  });

  final double? height;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxDecoration? decoration;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? assignHeight(context: context, fraction: 0.15),
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius ??
                BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius),
                  topRight: Radius.circular(topRightRadius),
                  bottomRight: Radius.circular(bottomRightRadius),
                  bottomLeft: Radius.circular(bottomLeftRadius),
                ),
            boxShadow: boxShadow,
          ),
      child: child,
    );
  }
}
