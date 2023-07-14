import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_pinelab_peripheralappservice_platform_interface.dart';

/// An implementation of [FlutterPinelabPeripheralappservicePlatform] that uses method channels.
class MethodChannelFlutterPinelabPeripheralappservice
    extends FlutterPinelabPeripheralappservicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('flutter_pinelab_peripheralappservice');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> sendRequest({required String request,required String methodName}) async {
    final result = await methodChannel.invokeMethod<String>(
      methodName,
      {
        'request': request,
      },
    );
    return result;
  }
}
