import 'package:get/get.dart';

class NavigationPath {
  static const String splashPage = "/";
  static const String homePage = "/Home";
  static const String productsPage = "/Products";
  static const String productDetailPage = "/ProductDetail";

  static const String loginScreen = "/LoginScreen";
  static const String otpScreen = "/OtpScreen";
  static const String submitDetails = "/SubmitDetails";
  static const String bottomBarScreen = "/BottomBarScreen";
  static const String settingsScreen = "/SettingsScreen";
  static const String createPostScreen = "/CreatePostScreen";
  static const String chatScreen = "/ChatScreen";

  static toOtpScreen({required String otp, required String userId}) {
    Get.toNamed("$otpScreen?otp=$otp&userId=$userId");
  }
}