
import 'flutter_web_amap_platform_interface.dart';

class FlutterWebAmap {
  Future<String?> getPlatformVersion() {
    return FlutterWebAmapPlatform.instance.getPlatformVersion();
  }
}
