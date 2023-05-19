import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_pinelab_peripheralappservice_method_channel.dart';

abstract class FlutterPinelabPeripheralappservicePlatform extends PlatformInterface {
  /// Constructs a FlutterPinelabPeripheralappservicePlatform.
  FlutterPinelabPeripheralappservicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPinelabPeripheralappservicePlatform _instance = MethodChannelFlutterPinelabPeripheralappservice();

  /// The default instance of [FlutterPinelabPeripheralappservicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPinelabPeripheralappservice].
  static FlutterPinelabPeripheralappservicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPinelabPeripheralappservicePlatform] when
  /// they register themselves.
  static set instance(FlutterPinelabPeripheralappservicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

   Future<String?> sendRequest({required String request}) {
    throw UnimplementedError('sendRequest() has not been implemented.');
  }
}
