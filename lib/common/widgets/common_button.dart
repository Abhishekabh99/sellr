import 'package:flutter/material.dart';
import '../../common_imports.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String text;

  final double width;
  final double height;

  const CommonButton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.width = double.maxFinite,
      this.height = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.buttonGradientStart,
              AppColors.buttonGradientEnd
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
