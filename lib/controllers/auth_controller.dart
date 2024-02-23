import 'package:flutter/cupertino.dart';
import 'package:flutter_task/models/create_account_model.dart';
import 'package:flutter_task/repositories/auth_repository.dart';
import 'package:get/get.dart';

import '../api/api_manager.dart';
import '../models/login_model.dart';
import '../widgets/constant_widgets.dart';

class AuthController extends GetxController{

  AuthRepository authRepository = AuthRepository(APIManager());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool selected = true.obs;


  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController mobileSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();


  Future<bool> loginAPI({bool isLoaderShow = true}) async {
    try {
      LoginModel loginModel = await authRepository.loginApiCall(isLoaderShow: isLoaderShow, params: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      });
      if(loginModel.message == "Signed in successfully"){
        return true;
      }else{
        errorSnackBar(message: loginModel.message);
        return false;
      }
    } catch (e) {
      print(
        "ashbfkjfbafabfaj"
      );
      return false;
    }
  }


  Future<bool> createAccountAPI({bool isLoaderShow = true}) async {
    try {
      CreateAccountModel createAccountModel = await authRepository.createAccountApiCall(isLoaderShow: isLoaderShow, params: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      });
      if(createAccountModel.message == "Account created successfully")
      {
        successSnackBar(message: createAccountModel.message);
        return true;
      }
      else
      {
        errorSnackBar(message: createAccountModel.message);
        return false;
      }
    } catch (e)
    {
      return false;
    }
  }

}