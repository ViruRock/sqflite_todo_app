import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

showToast({
  required String message,
  Toast toastLength = Toast.LENGTH_SHORT,
  Color? backgroundColor,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength,
    timeInSecForIosWeb: 2,
    textColor: Colors.white,
    backgroundColor: backgroundColor ?? Colors.black,
    fontSize:
        Theme.of(navigatorKey.currentContext!).textTheme.bodySmall?.fontSize ??
            14,
  );
}
