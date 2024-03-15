#include "include/talos_commons/talos_commons_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "talos_commons_plugin.h"

void TalosCommonsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  talos_commons::TalosCommonsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
