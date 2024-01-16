import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtil {
  static lockDevicePortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}