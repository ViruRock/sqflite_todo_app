import 'package:flutter/material.dart';

import '../main.dart';

showAppBar({
  String title = "",
  bool showBackButton = true,
  List<Widget> actionBtn = const [],
  TextStyle? titleStyle,
}) {
  titleStyle ??= Theme.of(navigatorKey.currentContext!)
      .textTheme
      .titleLarge!
      .copyWith(color: Colors.white);

  return AppBar(
    backgroundColor: Theme.of(navigatorKey.currentContext!).primaryColor,
    automaticallyImplyLeading: showBackButton,
    title: Text(
      title,
      style: titleStyle,
    ),
    actions: actionBtn,
  );
}
