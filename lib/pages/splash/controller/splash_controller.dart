import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellr/common_imports.dart';

class SplashController extends GetxController {
  final int _splashDuration = 3;

  late AnimationController _splashScreenAnimController;
  late Animation<double> opacityAndScaleAnim;

  SplashController(TickerProvider ticker) {
    _splashScreenAnimController = AnimationController(
        vsync: ticker, duration: Duration(seconds: _splashDuration));

    opacityAndScaleAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _splashScreenAnimController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.decelerate,
        ),
      ),
    );

    _splashScreenAnimController.addStatusListener(_onSplashAnimationStatusListen);

    _splashScreenAnimController.forward();
  }

  _onSplashAnimationStatusListen(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      Get.offAllNamed(NavigationPath.homePage);
    }
  }

  @override
  void onClose() {
    _splashScreenAnimController.removeStatusListener(_onSplashAnimationStatusListen);
    _splashScreenAnimController.dispose();
    super.onClose();
  }
}
