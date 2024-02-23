import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/routes/routes.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/text_field.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/network_controller.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  AuthController  authController = Get.find();
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: signUpKey,
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.only(top: 90,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Create an Account",style:TextHelper.h5.copyWith(fontWeight: FontWeight.w400))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Full name",style: TextHelper.h6.copyWith(color: ColorsForApp.textColor,fontSize: 16,fontWeight: FontWeight.w400)))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: authController.nameSignUpController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                        {
                          return "Please Enter Name";
                        }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Mobile number",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16,fontWeight: FontWeight.w400),))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: authController.mobileSignUpController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Mobile No";
                      }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Email ID",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16,fontWeight: FontWeight.w400),))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: authController.emailSignUpController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Email";
                      }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                  ),
                  SizedBox(height: 180,),
                  CommonButton(
                    onPressed: () async
                    {
                      if(signUpKey.currentState!.validate())
                        {
                          bool result = await authController.createAccountAPI();
                          if(result == true){
                            Get.toNamed(Routes.COWORKING_SCREEN);
                          }
                        }
                    },
                    label:"Create an account",
                    bgColor:Color(0xff5167EB),)
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Existing user?",style: TextStyle(color: Color(0xff626262),fontWeight: FontWeight.w400)
                    ),
                    TextSpan(
                        recognizer:TapGestureRecognizer()..onTap = ()
                        {
                          Get.toNamed(Routes.LOGIN_SCREEN);
                        }  ,
                        text: " Log in",style: TextStyle(color: Color(0xff2A1D8B),fontWeight: FontWeight.w400)
                    ),
                  ]
                ))
          ],
        ),
      ),
    );
  }
}
