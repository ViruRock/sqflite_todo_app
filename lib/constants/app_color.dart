import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = AppColor.fromHex('#673AB7');
  static Color primaryColorDark = AppColor.fromHex('#311B92');
  static Color primaryColorLight = AppColor.fromHex('#B39DDB');
  static Color secondaryColor = AppColor.fromHex('#E91E63');
}

extension AppColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
