import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_web_amap_platform_interface.dart';

/// An implementation of [FlutterWebAmapPlatform] that uses method channels.
class MethodChannelFlutterWebAmap extends FlutterWebAmapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_web_amap');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
