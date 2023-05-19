import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pinelab_peripheralappservice/flutter_pinelab_peripheralappservice.dart';
import 'package:flutter_pinelab_peripheralappservice/flutter_pinelab_peripheralappservice_platform_interface.dart';
import 'package:flutter_pinelab_peripheralappservice/flutter_pinelab_peripheralappservice_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPinelabPeripheralappservicePlatform
    with MockPlatformInterfaceMixin
    implements FlutterPinelabPeripheralappservicePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<String?> sendRequest({required String request}) {
    // TODO: implement sendRequest
    throw UnimplementedError();
  }
}

void main() {
  final FlutterPinelabPeripheralappservicePlatform initialPlatform = FlutterPinelabPeripheralappservicePlatform.instance;

  test('$MethodChannelFlutterPinelabPeripheralappservice is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPinelabPeripheralappservice>());
  });

  test('getPlatformVersion', () async {
    FlutterPinelabPeripheralappservice flutterPinelabPeripheralappservicePlugin = FlutterPinelabPeripheralappservice();
    MockFlutterPinelabPeripheralappservicePlatform fakePlatform = MockFlutterPinelabPeripheralappservicePlatform();
    FlutterPinelabPeripheralappservicePlatform.instance = fakePlatform;

    expect(await flutterPinelabPeripheralappservicePlugin.getPlatformVersion(), '42');
  });
}
