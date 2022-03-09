import 'package:flutter/services.dart';
import '../../common_imports.dart';
import 'controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late SplashController _controller;

  @override
  void initState() {
    _controller = SplashController(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Get.theme.primaryColor,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          )),
      backgroundColor: Get.theme.primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) => child!,
          child: _animatedLogo,
        ),
      ),
    );
  }

  //Widget _textField(
  //       {int maxLength = 100,
  //       required String hintText,
  //       TextInputType inputType = TextInputType.text,
  //       required TextEditingController textEditingController,
  //       bool isPassword = false}) {
  //     return TextField(
  //       controller: textEditingController,
  //       keyboardType: inputType,
  //       style: const TextStyle(color: Colors.black),
  //       maxLines: 1,
  //       maxLength: maxLength,
  //       textCapitalization: TextCapitalization.sentences,
  //       cursorColor: Colors.black,
  //       obscureText: isPassword,
  //       decoration: InputDecoration(
  //         counterText: "",
  //         labelText: hintText,
  //         focusedBorder: _focusedBorder,
  //         enabledBorder: _enabledBorder,
  //       ),
  //     );
  //   }

  Widget get _animatedLogo {
    return FadeTransition(
      opacity: _controller.opacityAndScaleAnim,
      child: ScaleTransition(
        scale: _controller.opacityAndScaleAnim,
        child: Image.asset(
          Assets.webpSplashArt,
        ),
      ),
    );
  }

}
