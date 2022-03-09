import 'package:sellr/common/base_getx_controller.dart';
import 'package:sellr/common_imports.dart';

class HomeController extends BaseGetXController {
  TextEditingController loginId = TextEditingController();

  login() async {
    final response = await repository.getShop(loginId.text);
    print(response.toJson());
    if (response.status == 200) {
      Get.toNamed(NavigationPath.productsPage);
    } else {}
  }
}
