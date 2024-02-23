import 'package:flutter_task/controllers/booking_controller.dart';
import 'package:get/get.dart';

class BookingBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(() => BookingController());
  }

}