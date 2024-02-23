import 'package:flutter_task/controllers/auth_controller.dart';
import 'package:flutter_task/controllers/slot_controller.dart';
import 'package:get/get.dart';

class SlotBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SlotController>(() => SlotController());
  }

}