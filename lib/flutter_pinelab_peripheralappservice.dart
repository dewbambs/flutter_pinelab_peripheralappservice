import 'dart:convert';

import 'package:flutter_pinelab_peripheralappservice/model/scan_response_model.dart';

import 'flutter_pinelab_peripheralappservice_platform_interface.dart';

class FlutterPinelabPeripheralappservice {
  Future<String?> getPlatformVersion() async {
    return await FlutterPinelabPeripheralappservicePlatform.instance
        .getPlatformVersion();
  }

  Future<ScanResponseModel?> startScan() async {
    final response =
        await FlutterPinelabPeripheralappservicePlatform.instance.sendRequest(
      request: json.encode(
        {
          'OperationType': 3004,
        },
      ),
    );

    return response != null ? ScanResponseModel.fromJson(response) : null;
  }
}
