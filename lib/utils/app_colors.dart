import 'package:flutter/material.dart';

class ColorsForApp {
  static Color textfieldColor = Color(0xffDADADA);
  static Color textColor = Color(0xff494949);
  static Color primaryColor = Color(0xff5167EB);
  static Color primaryColorBlue = const Color(0xff2255e1);
  static Color stepBgColor = ColorConverter.hexToColor("#e4ecff");
  static Color stepBorderColor = ColorConverter.hexToColor("#b5c4ee");
  static Color primaryShadeColor = ColorConverter.hexToColor("#e4e8fa");
  static Color secondaryColor = ColorConverter.hexToColor("#6C82BA");
  static Color chilliRedColor = ColorConverter.hexToColor("#C21807");
  static Color darkGreyColor = ColorConverter.hexToColor("#5d5d5d");
  static Color orangeColor = ColorConverter.hexToColor("#FF8C00");
  static Color accentColor = ColorConverter.hexToColor("#CCD5F8");
  static Color iconColor = ColorConverter.hexToColor("#7B93D0");
  static Color shadowColor = const Color(0xff6F6AF8).withOpacity(0.45);
  static Color blueShade6 = const Color(0xFF1066FF).withOpacity(0.06);
  static Color blueShade12 = const Color(0xFF1066FF).withOpacity(0.12);
  static Color blueBorderShade12 = const Color(0xFF413789).withOpacity(0.12);
  static Color blueShade22 = const Color(0xffCAD5FF).withOpacity(0.22);
  static Color selectedTabBackgroundColor = const Color(0xffD2E0FF);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black.withOpacity(0.8);
  static Color redColor = Colors.red;
  static Color greenColor = Colors.green;
  static Color amberColor = Colors.amber;
  static Color greyColor = Colors.grey;
  static Color lightBlue = ColorConverter.hexToColor("#377DFF");
  static Color dashColor = ColorConverter.hexToColor("#C4C4C4");
  static Color appBarColor = ColorConverter.hexToColor("#E8E8E8");
  static Color hintColor = ColorConverter.hexToColor("#9D9D9D");
  static Color grayScale200 = ColorConverter.hexToColor("#EEEEEE");
  static Color grayScale500 = ColorConverter.hexToColor("#9E9E9E");
  static Color otpFieldColor = ColorConverter.hexToColor("#F5F5F5");
  static Color searchFieldColor = ColorConverter.hexToColor("#D9D9D9");
  static Color selectedTabBgColor = ColorConverter.hexToColor("#E9F0FF");
  static Color unselectedTabBgColor = ColorConverter.hexToColor("#F4F4F4");
  static Color selectedTabTextColor = ColorConverter.hexToColor("#377DFF");
  static Color unselectedTabTextColor = ColorConverter.hexToColor("#757575");
  static Color lightGreenColor = ColorConverter.hexToColor("#D1FFD1");
  static Color lightYellowColor = ColorConverter.hexToColor("#FEF7EC");
  static Color lightRedColor = ColorConverter.hexToColor("#FFD1D1");
  static Color lightGreyColor = ColorConverter.hexToColor("#F8FAFF");
  static Color selectedJobColor = ColorConverter.hexToColor("#EEF4FF");
  static Color unselectedJobColor = ColorConverter.hexToColor("#F8F9FB");
  static Color drawerMenuBg = ColorConverter.hexToColor("#608DF6");
  static Color tabBgColor = ColorConverter.hexToColor("#EFF5FF");
  static Color shimmerBaseColor = Colors.grey[300]!;
  static Color shimmerHighlightColor = Colors.white;
  static Color lightBlueColor = ColorConverter.hexToColor("#AFBEE2");
  static Color lightGrayColor = ColorConverter.hexToColor("#F2F5FA");
  static Color noInternetConnectionColor = ColorConverter.hexToColor("#FFC700");
}

class ColorConverter {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
