import 'package:flutter/material.dart';
import 'my_network_image.dart';

class MyCircleImage extends StatelessWidget {
  final double imageSize;
  final String url;

  const MyCircleImage({Key? key, required this.imageSize, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageSize / 2),
      child: SizedBox(
        width: imageSize,
        height: imageSize,
        child: MyNetworkImage(url: url),
      ),
    );
  }
}
