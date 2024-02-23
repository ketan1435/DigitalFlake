import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/constant_widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


String baseUrl = "https://demo0413095.mockable.io/digitalflake/api/";
RxBool isTokenValid = false.obs;
RxBool isInternetAvailable = false.obs;

// Get storage keys
const loginTypeKey = 'loginType';
const loginDataKey = 'loginDataKey';
const apiTimeOutMsg = 'Request timeout, please try again!';
const noInternetMsg = 'Please check your internet connection';

