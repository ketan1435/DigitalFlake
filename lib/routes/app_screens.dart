import 'package:flutter_task/bindings/auth_binding.dart';
import 'package:flutter_task/bindings/availability_binding.dart';
import 'package:flutter_task/bindings/booking_binding.dart';
import 'package:flutter_task/bindings/booking_history.dart';
import 'package:flutter_task/bindings/network_binding.dart';
import 'package:flutter_task/bindings/slot_binding.dart';
import 'package:flutter_task/models/AvailabilityModel.dart';
import 'package:flutter_task/routes/routes.dart';
import 'package:flutter_task/screens/availability_screen.dart';
import 'package:flutter_task/screens/co_working_screen.dart';
import 'package:flutter_task/screens/login_screen.dart';
import 'package:flutter_task/screens/no_internet_connection_screen.dart';
import 'package:flutter_task/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import '../screens/booking_history.dart';
import '../screens/select_slot_screen.dart';
class AppPages
{
  static String INITIAL_ROUTE = Routes.LOGIN_SCREEN;
  static final routes =
  [
    GetPage(
        name: Routes.SIGN_UP_SCREEN,
        page: ()=>SignupScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.LOGIN_SCREEN,
        page: ()=>LoginScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.COWORKING_SCREEN,
        page: ()=>CoworkingScreen(),
        binding: BookingBinding()
    ),
    GetPage(
        name: Routes.SELECT_SLOT_SCREEN,
        page: ()=>SelectSlotScreen(),
        binding: SlotBinding()
    ),
    GetPage(
        name: Routes.AVAILABILITY_SCREEN,
        page: ()=>AvailabilityScreen(),
        binding: AvailabilityBinding()
    ),
    GetPage(
        name: Routes.BOOKING_HISTORY_SCREEN,
        page: ()=>BookingHistoryScreen(),
        binding: BookingHistoryBinding()
    ),
    GetPage(
        name: Routes.NO_INTERNET_CONNECTION_SCREEN,
        page: ()=>NoInternetConnectionScreen(),
        binding: NetworkBinding()
    ),
  ];
}