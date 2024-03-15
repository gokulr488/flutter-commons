#ifndef FLUTTER_PLUGIN_TALOS_COMMONS_PLUGIN_H_
#define FLUTTER_PLUGIN_TALOS_COMMONS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace talos_commons {

class TalosCommonsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  TalosCommonsPlugin();

  virtual ~TalosCommonsPlugin();

  // Disallow copy and assign.
  TalosCommonsPlugin(const TalosCommonsPlugin&) = delete;
  TalosCommonsPlugin& operator=(const TalosCommonsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace talos_commons

#endif  // FLUTTER_PLUGIN_TALOS_COMMONS_PLUGIN_H_
