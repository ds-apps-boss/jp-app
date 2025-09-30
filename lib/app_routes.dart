import 'package:flutter/material.dart';
import 'screen_start.dart';
import 'screen_main.dart';
import 'screen_details.dart';

class Routes {
  static const screenStart = '/';
  static const screenMain = '/screenMain';
  static const screenDetail = '/screenDetail';
}

final Map<String, WidgetBuilder> routes = {
  Routes.screenStart: (_) => const ScreenStart(),
  Routes.screenMain: (_) => ScreenMain(),
  Routes.screenDetail: (_) => const ScreenDetail(),
};
