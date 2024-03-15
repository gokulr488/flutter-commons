import 'package:flutter_test/flutter_test.dart';
import 'package:talos_commons/talos_commons.dart';
import 'package:talos_commons/talos_commons_platform_interface.dart';
import 'package:talos_commons/talos_commons_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTalosCommonsPlatform
    with MockPlatformInterfaceMixin
    implements TalosCommonsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TalosCommonsPlatform initialPlatform = TalosCommonsPlatform.instance;

  test('$MethodChannelTalosCommons is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTalosCommons>());
  });

  test('getPlatformVersion', () async {
    TalosCommons talosCommonsPlugin = TalosCommons();
    MockTalosCommonsPlatform fakePlatform = MockTalosCommonsPlatform();
    TalosCommonsPlatform.instance = fakePlatform;

    expect(await talosCommonsPlugin.getPlatformVersion(), '42');
  });
}
