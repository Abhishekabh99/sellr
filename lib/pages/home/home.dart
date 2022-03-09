import 'package:sellr/common/widgets/common_button.dart';
import 'package:sellr/common_imports.dart';
import 'package:sellr/pages/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        titleSpacing: 16,
        title: const Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Hero(
          tag: "back",
          child: Material(
            type: MaterialType.transparency,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                Assets.svgIcBack,
                color: Colors.white,
                width: 28,
                height: 28,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: mainAxisCenter,
          crossAxisAlignment: crossAxisCenter,
          children: [_searchField, 24.toVerticalSpace(), _submitButton],
        ),
      ),
    );
  }

  Widget get _searchField {
    return Hero(
      tag: "search",
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: 24.toRadius()),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.svgIcSearch,
                    color: Colors.black,
                  ),
                  12.toHorizontalSpace(),
                  Expanded(
                    child: Material(
                      type: MaterialType.transparency,
                      child: TextField(
                        controller: controller.loginId,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: "Enter shopper booth number here...",
                        ),
                      ).alignCenterLeft(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CommonButton get _submitButton {
    return CommonButton(
      text: "Submit",
      onPressed: () {
        controller.login();
      },
    );
  }
}
