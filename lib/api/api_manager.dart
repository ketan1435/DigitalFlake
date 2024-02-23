// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../widgets/constant_widgets.dart';
import '../utils/string_constants.dart';
import 'api_exception.dart';

class APIManager {
  bool isNoInternetMessageDisplayed = false;
  bool isSessionExpiredMessageDisplayed = false;

  // GET
  Future<dynamic> getAPICall({required String url, bool isLoaderShow = true, int timeOut = 60}) async {
    var responseJson;
    try {
      // Check internet is on or not
      if (isInternetAvailable.value == true) {
        await http.get(Uri.parse(url)).timeout(Duration(seconds: timeOut)).then((response) {
          log('\x1B[90m<--------------------------- [GET API] --------------------------->\x1B[0m');
          log('\x1B[94m[Url] => \x1B[95m$url\x1B[0m');
          log('\x1B[94m[Response (${response.statusCode})] => \x1B[96m${response.statusCode == 200 ? response.body : response.reasonPhrase}\x1B[0m');
          log('\x1B[90m<----------------------------------------------------------------->\x1B[0m');
          responseJson = _response(response);
        });
      } else {
        handleNoInternet();
      }
    } on SocketException catch (error) {
      handleSocketException(error);
    } on TimeoutException {
      handleTimeoutException();
    } catch (error, stackTrace) {
      handleGenericError(error, stackTrace);
    } finally {
    }
    return responseJson;
  }

  // POST
  Future<dynamic> postAPICall({required String url, required var params, bool isLoaderShow = true, int timeOut = 60}) async {
    var responseJson;
    try {
      // Check internet is on or not
      if (isInternetAvailable.value == true) {
        String body = json.encode(params);
        await http.post(Uri.parse(url),body: body).timeout(Duration(seconds: timeOut)).then((response) {
          log('\x1B[90m<--------------------------- [POST API] --------------------------->\x1B[0m');
          log('\x1B[94m[Url] => \x1B[95m$url\x1B[0m');
          log('\x1B[94m[Parameters] => \x1B[95m$body\x1B[0m');
          log('\x1B[94m[Response (${response.statusCode})] => \x1B[96m${response.statusCode == 200 ? response.body : response.reasonPhrase}\x1B[0m');
          log('\x1B[90m<----------------------------------------------------------------->\x1B[0m');
          responseJson = _response(response);
        });
      } else {
        handleNoInternet();
      }
    } on SocketException catch (error) {
      handleSocketException(error);
    } on TimeoutException catch (_) {
      handleTimeoutException();
    } catch (error, stackTrace) {
      handleGenericError(error, stackTrace);
    } finally {
    }
    return responseJson;
  }

  void handleNoInternet() {
    if (isNoInternetMessageDisplayed == false) {
      errorSnackBar(message: noInternetMsg);
      isNoInternetMessageDisplayed = true;
    }
  }

  void handleSessionExpired() {
    if (isSessionExpiredMessageDisplayed == false) {
      errorSnackBar(message: 'Your session has expired!');
      isSessionExpiredMessageDisplayed = true;
    }
  }

  void handleSocketException(SocketException error) {
    // if (error.osError!.errorCode == 7 || error.osError!.errorCode == 101 || error.osError!.errorCode == 103 || error.osError!.errorCode == 104) {
    //   handleNoInternet();
    // } else {
    log('\x1B[91m[Handle Socket Exception] => $error\x1B[0m');
    throw FetchDataException(error.toString());
    // }
  }

  void handleTimeoutException() {
    errorSnackBar(message: apiTimeOutMsg);
    throw FetchDataException(apiTimeOutMsg);
  }

  void handleGenericError(error, StackTrace stackTrace) {
    log('\x1B[91m[Handle Generic Error] => $error\x1B[0m');
    if (error.toString().contains('Connection closed while receiving data')) {
      errorSnackBar(message: 'An error occured while communication with server');
    }
    throw FetchDataException('Server Error');
  }

  dynamic _response(http.Response response) async {
    switch (response.statusCode) {
      // Successfully get api response
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 202:
        var responseJson = json.decode(response.body);
        return responseJson;
      // No content
      case 204:
        throw BadRequestException(response.reasonPhrase);
      // Bad request need to check url
      case 400:
        log('\x1B[91m[400-Bad Request] => ${response.body}\x1B[0m');
        throw BadRequestException(response.body);
      // Unauthorized
      case 401:
        errorSnackBar(message: response.body);
        throw BadRequestException(response.body);
      // Authorisation token invalid
      case 403:
        errorSnackBar(message: response.body);
        throw UnauthorisedException(response.body);
      // Error occured while communication with server
      case 500:
      default:
        errorSnackBar(message: 'An error occured while communication to server with status code: ${response.statusCode}');
        throw FetchDataException(
          'An error occured while communication to server with status code: ${response.statusCode}',
        );
    }
  }
}
