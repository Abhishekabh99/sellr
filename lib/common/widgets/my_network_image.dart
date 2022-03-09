import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const MyNetworkImage(
      {Key? key, required this.url, this.loadingWidget, this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url, fit: BoxFit.cover,
      loadingBuilder: (c, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: SizedBox(
            width: 32,
            height: 32,
            child: loadingWidget ??
                (Platform.isIOS
                    ? const CupertinoActivityIndicator(radius: 20)
                    : const CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
          ),
        );
      },
      errorBuilder: (context, value, _) {
        return Center(
          child: SizedBox(
            width: 32,
            height: 32,
            child: errorWidget ?? const Icon(Icons.info),
          ),
        );
      },
    );
  }
}
