import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_at_login/launch_at_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isEnabled;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      isEnabled = await LaunchAtLogin.isEnabled;
    } on PlatformException {
      print('Failed to find out if launch at login enabled');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    print(isEnabled);
    setState(() {
      _isEnabled = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Switch(
              onChanged: (isEnabled) async {
                print(isEnabled);
                bool status;
                if (_isEnabled) {
                  status = await LaunchAtLogin.disable;
                } else {
                  status = await LaunchAtLogin.enable;
                }
                print(status);
                setState(() {
                  _isEnabled = status;
                });
              },
              value: _isEnabled),
        ),
      ),
    );
  }
}
