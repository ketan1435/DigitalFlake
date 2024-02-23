import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/booking_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../routes/routes.dart';
class CoworkingScreen extends StatefulWidget {
  const CoworkingScreen({super.key});

  @override
  State<CoworkingScreen> createState() => _CoworkingScreenState();
}

class _CoworkingScreenState extends State<CoworkingScreen> {

  BookingController bookingController = Get.find();
  bool select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 76,left: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/coworking1.png",height:22,),
                  Text(" Co-working",style: TextStyle(color: Color(0xff534F4F)),),
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.BOOKING_HISTORY_SCREEN);
                      },
                      child: Container(
                        height: 30,
                        width: 131,
                        decoration: BoxDecoration(
                          color: Color(0xff5167EB),
                          borderRadius: BorderRadius.circular(7)
                        ),
                        child: Center(child: Text("Booking history",style: TextStyle(color: Color(0xffFFFFFF)),)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80,left: 36
                  ),
                  child: GestureDetector(
                    onTap: (){
                          setState(() {
                            select =! select;
                          });
                          bookingController.val.value = 1;
                          Get.toNamed(Routes.SELECT_SLOT_SCREEN);
                    },
                    child: Container(
                      height: 147,
                      width: 147,
                      decoration:BoxDecoration(
                        color:select? Color(0xff4D60D1):Color(0xffC7CFFc),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/bookwork_image.png")
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80,left: 25),
                  child: GestureDetector(
                    onTap: (){
                        setState(() {
                          select =! select;
                        });
                        bookingController.val.value = 2;
                        Get.toNamed(Routes.SELECT_SLOT_SCREEN);
                    },
                    child: Container(
                      height: 147,
                      width: 147,
                      decoration: BoxDecoration(
                          color:select?Color(0xffC7CFFc):Color(0xff4D60D1),
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          children: [
                            Container(
                              height:8.h,
                              width: 83,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/meet_img1.png")
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}
