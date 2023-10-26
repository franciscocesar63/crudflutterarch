import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // Data sources

    // Repository

    Get.put(HomeController());
  }
}
