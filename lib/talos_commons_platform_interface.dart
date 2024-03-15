import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'talos_commons_method_channel.dart';

abstract class TalosCommonsPlatform extends PlatformInterface {
  /// Constructs a TalosCommonsPlatform.
  TalosCommonsPlatform() : super(token: _token);

  static final Object _token = Object();

  static TalosCommonsPlatform _instance = MethodChannelTalosCommons();

  /// The default instance of [TalosCommonsPlatform] to use.
  ///
  /// Defaults to [MethodChannelTalosCommons].
  static TalosCommonsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TalosCommonsPlatform] when
  /// they register themselves.
  static set instance(TalosCommonsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
