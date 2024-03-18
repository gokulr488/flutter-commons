//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_saver/file_saver_plugin.h>
#include <talos_commons/talos_commons_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSaverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSaverPlugin"));
  TalosCommonsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("TalosCommonsPluginCApi"));
}
