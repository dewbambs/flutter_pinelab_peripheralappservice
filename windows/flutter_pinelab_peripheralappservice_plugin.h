#ifndef FLUTTER_PLUGIN_FLUTTER_PINELAB_PERIPHERALAPPSERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_PINELAB_PERIPHERALAPPSERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_pinelab_peripheralappservice {

class FlutterPinelabPeripheralappservicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterPinelabPeripheralappservicePlugin();

  virtual ~FlutterPinelabPeripheralappservicePlugin();

  // Disallow copy and assign.
  FlutterPinelabPeripheralappservicePlugin(const FlutterPinelabPeripheralappservicePlugin&) = delete;
  FlutterPinelabPeripheralappservicePlugin& operator=(const FlutterPinelabPeripheralappservicePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_pinelab_peripheralappservice

#endif  // FLUTTER_PLUGIN_FLUTTER_PINELAB_PERIPHERALAPPSERVICE_PLUGIN_H_
