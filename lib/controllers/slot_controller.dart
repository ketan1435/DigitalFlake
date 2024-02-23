import 'package:flutter_task/models/AvailabilityModel.dart';
import 'package:flutter_task/models/booking_model.dart';
import 'package:flutter_task/models/slots_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../api/api_manager.dart';
import '../repositories/auth_repository.dart';

class SlotController extends GetxController {
  AuthRepository authRepository = AuthRepository(APIManager());

  RxBool selectedValue = false.obs;
  RxString selectedSlotId = "".obs;
  RxString selectedBookingId = "".obs;

  RxString formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  RxList<Slots> slotList = <Slots>[].obs;
  RxList<Availability> availabilityList = <Availability>[].obs;
  RxList<BookingModel> bookingList = <BookingModel>[].obs;

  Future<bool> getSlotsApi() async {
    try {
      SlotsModel slotsModel = await authRepository.selectSlotApiCall(date: formattedDate.value);

      if (slotsModel.slots != null && slotsModel.slots!.isNotEmpty) {
        slotList.clear();
        slotList.addAll(slotsModel.slots!);
        return true;
      } else {
        slotList.clear();
        return false;
      }
    } catch (e) {
      print('Error in getSlotsApi: $e');
      return false;
    }
  }

  Future<bool> getAvailabilityApi(String type) async {
    try {
      AvailabilityModel availabilityModel = await authRepository.availabilityApiCall(
        date: formattedDate.value,
        slotId: selectedSlotId.value,
        type: type,
      );

      if (availabilityModel.availability != null && availabilityModel.availability!.isNotEmpty) {
        availabilityList.clear();
        availabilityList.addAll(availabilityModel.availability!);
        return true;
      } else {
        availabilityList.clear();
        return false;
      }
    } catch (e) {
      print('Error in getAvailabilityApi: $e');
      return false;
    }
  }

  Future<bool> bookingHistoryApi(String type) async {
    try {
      BookingModel bookingModel = await authRepository.bookingHistoryApiCall(userId: selectedBookingId.value);

      if (bookingModel.message != null && bookingModel.message!.isNotEmpty) {
        bookingList.clear();

        if (bookingModel.message != null) {
          bookingList.addAll(bookingModel.message as Iterable<BookingModel>);
        }
        return true;
      } else {
        bookingList.clear();
        return false;
      }
    } catch (e) {
      print('Error in bookingHistoryApi: $e');
      return false;
    }
  }
}
