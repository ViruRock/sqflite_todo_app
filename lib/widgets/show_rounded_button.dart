import 'package:flutter/material.dart';

import '../main.dart';

showRoundedBorderButton({
  required String btnText,
  required VoidCallback onPressed,
  TextStyle? titleStyle,
  bool showRoundedBorder = false,
}) {
  titleStyle ??=
      Theme.of(navigatorKey.currentContext!).textTheme.bodyLarge!.copyWith(
            color: Theme.of(navigatorKey.currentContext!).primaryColor,
            fontWeight: FontWeight.bold,
          );

  return TextButton(
    onPressed: onPressed,
    style: showRoundedBorder
        ? TextButton.styleFrom(
            side: BorderSide(
              width: 1.5,
              color: Theme.of(navigatorKey.currentContext!).primaryColor,
            ),
            textStyle: Theme.of(navigatorKey.currentContext!)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
            foregroundColor:
                Theme.of(navigatorKey.currentContext!).primaryColor,
          )
        : TextButton.styleFrom(
            textStyle: Theme.of(navigatorKey.currentContext!)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
            foregroundColor:
                Theme.of(navigatorKey.currentContext!).primaryColor,
          ),
    child: Text(
      btnText,
      style: titleStyle,
    ),
  );
}
