import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

// Snack bar for showing success message
successSnackBar({String title = 'Success', String? message}) {
  Get.log('\x1B[92m[$title] => $message\x1B[0m');
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.withOpacity(0.80),
      icon: const Icon(Icons.task_alt_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 700),
    ),
  );
}

// Snack bar for showing pending message
pendingSnackBar({String title = 'Pending', String? message}) {
  Get.log('\x1B[93m[$title] => $message\x1B[0m');
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.orange.withOpacity(0.80),
      icon: const Icon(Icons.timelapse_rounded, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 700),
    ),
  );
}

// Snack bar for showing error message
errorSnackBar({String title = 'Failure', String? message}) {
  Get.log('\x1B[91m[$title] => $message\x1B[0m', isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.withOpacity(0.80),
      icon: const Icon(Icons.gpp_bad_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 700),
    ),
  );
}

// Custom dialog
Future<dynamic> customSimpleDialog({
  required BuildContext context,
  Widget? title,
  Widget? description,
  String? noText,
  Function()? onNo,
  String? yesText,
  Function()? onYes,
  bool? preventToClose,
  bool? isButtonVisible = true,
  bool? barrierDismissible = false,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible!,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return preventToClose ?? true;
        },
        child: SimpleDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          contentPadding: const EdgeInsets.only(top: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: title!,
          children: [
            SizedBox(
              width: 100.w,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: description!,
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: isButtonVisible == true ? true : false,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: onNo ??
                                  () {
                                    Get.back();
                                  },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: ColorsForApp.greyColor,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  noText ?? 'No',
                                  style: TextHelper.size15.copyWith(
                                    color: ColorsForApp.blackColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: onYes,
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ColorsForApp.primaryColorBlue,
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  yesText ?? 'Yes',
                                  style: TextHelper.size15.copyWith(
                                    color: ColorsForApp.whiteColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}



// Custom card for report
Widget customCard({required Widget child, Color? shadowColor}) {
  return Card(
    color: ColorsForApp.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 2,
      color: ColorsForApp.whiteColor,
      shadowColor: shadowColor,
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorsForApp.grayScale500.withOpacity(0.5),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    ),
  );
}

// Common message dialog
showCommonMessageDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 4,
        title: Center(
          child: Text(
            title,
            style: TextHelper.size20.copyWith(
              fontFamily: mediumFont,
              color: Colors.white
            ),
          ),
        ),
        content: 
        Container(
          child: Text(
            message,
            style: TextHelper.size14.copyWith(
              color: ColorsForApp.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
            child: InkWell(
              onTap: () async {
                Get.back();
              },
              splashColor: ColorsForApp.primaryColorBlue.withOpacity(0.1),
              highlightColor: ColorsForApp.primaryColorBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
              child: Center(
                child: Container(
                  height: 35,
                  width: 140,
                  color: Color(0xff5167Eb),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Center(
                    child: Text(
                      'Confirm',
                        style: TextHelper.size14.copyWith(
                        fontFamily: mediumFont,
                        color:Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}


