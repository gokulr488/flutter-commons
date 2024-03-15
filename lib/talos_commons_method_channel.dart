import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'talos_commons_platform_interface.dart';

/// An implementation of [TalosCommonsPlatform] that uses method channels.
class MethodChannelTalosCommons extends TalosCommonsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('talos_commons');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
