import 'package:flutter_task/controllers/booking_controller.dart';
import 'package:flutter_task/controllers/slot_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class BookingHistoryBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => SlotController());
  }

}