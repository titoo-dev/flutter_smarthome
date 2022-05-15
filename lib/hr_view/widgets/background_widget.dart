import 'package:flutter/material.dart';

import '../value/images.dart';

class BackgroundWidget extends StatelessWidget {
  final bool hasImage;
  final ImageProvider image;
  final Color color;
  final double height;

  BackgroundWidget({
    this.hasImage = true,
    this.color = Colors.purple,
    this.image = const AssetImage(ImagePath.livingRoom1),
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: hasImage
          ? BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            )
          : BoxDecoration(color: color),
    );
  }
}
