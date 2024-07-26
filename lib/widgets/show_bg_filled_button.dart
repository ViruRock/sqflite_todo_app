import 'package:flutter/material.dart';

import '../main.dart';

showBgFilledButton({
  required String btnText,
  required VoidCallback onPressed,
  TextStyle? titleStyle,
}) {
  titleStyle ??=
      Theme.of(navigatorKey.currentContext!).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          );

  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      btnText,
      style: titleStyle,
    ),
  );
}
