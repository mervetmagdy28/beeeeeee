import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';


class searchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => searchController());
  }
}