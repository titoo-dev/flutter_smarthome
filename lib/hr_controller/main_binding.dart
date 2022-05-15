import 'package:get/get.dart';

import '../home_page/controller/home_page_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
