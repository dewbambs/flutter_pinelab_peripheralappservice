import 'package:flutter_pinelab_peripheralappservice/model/response_model.dart';

import 'flutter_pinelab_peripheralappservice_platform_interface.dart';

class FlutterPinelabPeripheralappservice {
  Future<String?> getPlatformVersion() async {
    return await FlutterPinelabPeripheralappservicePlatform.instance
        .getPlatformVersion();
  }

  Future<ResponseModel?> startScan() async {
    final response =
        await FlutterPinelabPeripheralappservicePlatform.instance.sendRequest(
      request: {
        'OperationType': 3004,
      }.toString(),
    );

    return response != null ? ResponseModel.fromJson(response) : null;
  }
}
