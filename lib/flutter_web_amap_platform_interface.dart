import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_web_amap_method_channel.dart';

abstract class FlutterWebAmapPlatform extends PlatformInterface {
  /// Constructs a FlutterWebAmapPlatform.
  FlutterWebAmapPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWebAmapPlatform _instance = MethodChannelFlutterWebAmap();

  /// The default instance of [FlutterWebAmapPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWebAmap].
  static FlutterWebAmapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWebAmapPlatform] when
  /// they register themselves.
  static set instance(FlutterWebAmapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
