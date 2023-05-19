
import 'flutter_pinelab_peripheralappservice_platform_interface.dart';

class FlutterPinelabPeripheralappservice {
  Future<String?> getPlatformVersion() {
    return FlutterPinelabPeripheralappservicePlatform.instance.getPlatformVersion();
  }
}
