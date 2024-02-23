import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../controllers/slot_controller.dart';
import '../routes/routes.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class SelectSlotScreen extends StatefulWidget {
  const SelectSlotScreen({Key? key}) : super(key: key);

  @override
  State<SelectSlotScreen> createState() => _SelectSlotScreenState();
}

class _SelectSlotScreenState extends State<SelectSlotScreen> {
  final SlotController slotController = Get.find();

  @override
  void initState() {
    super.initState();
    callApi();
  }

   callApi() async {
    await slotController.getSlotsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(()=>
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
                  Text(
                    "Select Date & Slot",
                    style: TextHelper.h6.copyWith(color: ColorsForApp.textColor, fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff4D60D1),
                selectedTextColor: Colors.white,
                onDateChange: (date) async {
                  slotController.formattedDate.value = DateFormat('yyyy-MM-dd').format(date);
                  await slotController.getSlotsApi();
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: slotController.slotList.isEmpty?
              Center( child: Text("No data found!")):
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: slotController.slotList.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        slotController.selectedSlotId.value = slotController.slotList[index].slotId!.toString();
                      },
                      child: Container(
                        height: 3.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:slotController.slotList[index].slotActive == true ? Colors.blue.shade100:Colors.grey,
                        ),
                        child: Center(
                          child: Text(slotController.slotList[index].slotName!),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            CommonButton(onPressed: () {
              Get.toNamed(Routes.AVAILABILITY_SCREEN);
            }, label: "Next"),
          ],
        ),
      ),
    );
  }
}
