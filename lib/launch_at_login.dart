import 'dart:async';

import 'package:flutter/services.dart';

class LaunchAtLogin {
  static const MethodChannel _channel = const MethodChannel('launch_at_login');

  static Future<bool> get isEnabled async {
    return await _channel.invokeMethod('isEnabled');
  }

  static Future<bool> get enable async {
    return await _channel.invokeMethod('enable');
  }

  static Future<bool> get disable async {
    return await _channel.invokeMethod('disable');
  }
}
