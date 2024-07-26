import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../main.dart';

loader() {
  showDialog(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    builder: (context) => const Center(
      child: SpinKitPouringHourGlass(
        color: Colors.white,
      ),
    ),
  );
}

linearLoader() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: LinearProgressIndicator(
        backgroundColor:
            Theme.of(navigatorKey.currentContext!).primaryColorLight,
        color: Theme.of(navigatorKey.currentContext!).primaryColor,
      ),
    ),
  );
}
