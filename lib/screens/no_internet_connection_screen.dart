import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../generated/assets.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/button.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                Assets.animationsNoInternetConnection,
                fit: BoxFit.cover,
              ),
              height(3.h),
              Text(
                'Whoops!',
                textAlign: TextAlign.center,
                style: TextHelper.h2.copyWith(
                  fontFamily: boldFont,
                  color: ColorsForApp.secondaryColor,
                ),
              ),
              height(1.h),
              Text(
                'No internet connection found.\nPlease check your network settings.',
                textAlign: TextAlign.center,
                style: TextHelper.size17.copyWith(
                  fontFamily: mediumFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
