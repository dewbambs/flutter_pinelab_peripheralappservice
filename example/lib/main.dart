import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_pinelab_peripheralappservice/flutter_pinelab_peripheralappservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterPinelabPeripheralappservicePlugin =
      FlutterPinelabPeripheralappservice();
  String _responseMessage = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> _startScan() async {
    /// do transaction for pinelabs device.
    /// calls the pinelab device with the header provided in the constructor.
    /// one can override the contructor using [overrideHeader] parameter.
    final response =
        await _flutterPinelabPeripheralappservicePlugin.startScan();

    /// provides ResponseModel in return which contains the response from the pinelabs device.
    setState(() {
      _responseMessage = (response ?? 'NO RESPONSE').toString();
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterPinelabPeripheralappservicePlugin
              .getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Peripheral Plugin Example'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Center(
                  child: Text('Running on: $_platformVersion\n'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Start Scan'),
                  onPressed: () async {
                    _responseMessage = '';
                    _startScan();
                  },
                ),
                const SizedBox(width: 20),
                Text(_responseMessage),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
