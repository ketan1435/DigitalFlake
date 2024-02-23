import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/auth_controller.dart';
import 'package:flutter_task/routes/routes.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/text_field.dart';
import 'package:get/get.dart';
import '../controllers/network_controller.dart';
import '../utils/app_colors.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController authController = Get.find();
  NetworkController networkController = Get.put(NetworkController(), permanent: true);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                      Padding(
                        padding: EdgeInsets.only(top: 89),
                        child: Container(
                          height:44 ,
                          width: 44,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage("assets/images/coworking1.png"))
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          child: Center(child: Text("Co-working",style:TextStyle(color: Colors.black,fontSize: 24)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70,left: 27),
                      child: Row(
                        children: [
                          Center(child: Text("Mobile number or Email",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16),))
                        ],
                      ),
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: authController.emailController,
                      validator: (val)
                      {
                        if(val!.isEmpty)
                        {
                          return "Please Enter Mobile number or Email";
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
                          Center(child: Text("Password",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16),))
                        ],
                      ),
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: authController.passwordController,
                      validator: (val)
                      {
                        if(val!.isEmpty)
                        {
                          return "Please Enter Password";
                        }
                        else {
                          return null;
                        }
                      },
                      fillColor: ColorsForApp.textfieldColor,
                      filled: true,
                      obscureText: authController.selected.value,
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            authController.selected.value =! authController.selected.value;
                          });
                        },
                          child: authController.selected.value?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off_outlined)),
                    ),
                    SizedBox(height: 150,),
                    CommonButton(
                      onPressed: () async
                      {
                        if(loginKey.currentState!.validate())
                        {
                          bool result = await authController.loginAPI();
                          if(result == true){
                            Get.toNamed(Routes.COWORKING_SCREEN);
                          }
                        }
                      },
                      label:"Log in",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),
                      bgColor:Color(0xff5167EB),)
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "New user?",style: TextStyle(color: Color(0xff626262))
                        ),
                        TextSpan(
                            recognizer:TapGestureRecognizer()..onTap = ()
                            {
                              Get.toNamed(Routes.SIGN_UP_SCREEN);
                            }  ,
                            text: " Create an account",style: TextStyle(color: Color(0xff2A1D8B),fontWeight: FontWeight.w500)
                        ),
                      ]
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
