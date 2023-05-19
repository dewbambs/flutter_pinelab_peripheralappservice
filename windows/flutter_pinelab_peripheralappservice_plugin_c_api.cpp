#include "include/flutter_pinelab_peripheralappservice/flutter_pinelab_peripheralappservice_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_pinelab_peripheralappservice_plugin.h"

void FlutterPinelabPeripheralappservicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_pinelab_peripheralappservice::FlutterPinelabPeripheralappservicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
