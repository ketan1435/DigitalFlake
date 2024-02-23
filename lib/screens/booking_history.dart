import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/booking_controller.dart';
import 'package:flutter_task/controllers/slot_controller.dart';
import 'package:flutter_task/utils/app_colors.dart';
import 'package:flutter_task/utils/text_styles.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/constant_widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  late BookingController bookingController;
  late SlotController slotController;

  @override
  void initState() {
    super.initState();
    bookingController = Get.find<BookingController>();
    slotController = Get.find<SlotController>(); // Initialize slotController
    callApi();
  }

  Future<void> callApi() async {
    await slotController.getAvailabilityApi(bookingController.val.value.toString());
    await slotController.bookingHistoryApi(bookingController.val.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() =>
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 24),
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back, size: 24, color: Colors.black),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 36),
                    Text("Available desks", style: TextHelper.h6.copyWith(color: ColorsForApp.textColor, fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: [
                    Text("Wed 31 May , 05.00PM-06.00PM", style: TextHelper.h6.copyWith(fontSize: 13, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: GridView.builder(
                    itemCount: slotController.bookingList.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 3.h,
                        width: 10.w,
                        color: slotController.bookingList[index].message == true ? Colors.blue.shade100 : Colors.grey,
                        child: Center(
                          child: Text(slotController.bookingList[index].message.toString()),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}