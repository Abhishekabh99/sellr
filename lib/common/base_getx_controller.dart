import 'package:get/get.dart';

import '../web/repository_provider.dart';
import 'constants.dart';

class BaseGetXController extends GetxController {
  late RepositoryProvider repository;
  // late String myId = Storage.getUserID ?? "";

  @override
  void onInit() {
    repository = Get.find<RepositoryProvider>();
    printLog("repository hash: ${repository.hashCode}");
    super.onInit();
  }
}
