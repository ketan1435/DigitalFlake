import 'dart:async';

import 'package:flutter_task/models/AvailabilityModel.dart';
import 'package:flutter_task/models/create_account_model.dart';

import '../api/api_manager.dart';
import '../models/booking_model.dart';
import '../models/login_model.dart';
import '../models/slots_model.dart';
import '../utils/string_constants.dart';

class AuthRepository {
  final APIManager apiManager;
  AuthRepository(this.apiManager);

  //Login api
  Future<LoginModel> loginApiCall({required var params, bool isLoaderShow = true}) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}login',
      params: params,
      isLoaderShow: isLoaderShow,
    );
    var response = LoginModel.fromJson(jsonData);
    return response;
  }


  //Create Account api
  Future<CreateAccountModel> createAccountApiCall({required var params, bool isLoaderShow = true}) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}create_account',
      params: params,
      isLoaderShow: isLoaderShow,
    );
    var response = CreateAccountModel.fromJson(jsonData);
    return response;
  }

  //select Slot api
  Future<SlotsModel> selectSlotApiCall({bool isLoaderShow = true,required String date}) async{
    var jsonData = await apiManager.getAPICall(
        url: '${baseUrl}get_slots?date=$date',
         isLoaderShow: isLoaderShow,
    );
    var response = SlotsModel.fromJson(jsonData);
    return response;
  }

  //booking history api
  Future<BookingModel> bookingHistoryApiCall ({ required String userId , bool isLoaderShow = true}) async {
    var jsonData = await apiManager.getAPICall(
        url: "${baseUrl}get_bookings?user_id=$userId",
        isLoaderShow: isLoaderShow
         );
    var response = BookingModel.fromJson(jsonData);
    return response;
  }

  //booking history api
  Future<AvailabilityModel> availabilityApiCall ({ required String date,required String slotId ,required String type, bool isLoaderShow = true}) async {
    var jsonData = await apiManager.getAPICall(
        url: "${baseUrl}get_availability?date=$date&slot_id=$slotId&type=$type",
        isLoaderShow: isLoaderShow
    );
    var response = AvailabilityModel.fromJson(jsonData);
    return response;
  }

}
