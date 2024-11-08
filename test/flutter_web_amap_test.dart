import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_amap/flutter_web_amap.dart';
import 'package:flutter_web_amap/flutter_web_amap_platform_interface.dart';
import 'package:flutter_web_amap/flutter_web_amap_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWebAmapPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWebAmapPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterWebAmapPlatform initialPlatform = FlutterWebAmapPlatform.instance;

  test('$MethodChannelFlutterWebAmap is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWebAmap>());
  });

  test('getPlatformVersion', () async {
    FlutterWebAmap flutterWebAmapPlugin = FlutterWebAmap();
    MockFlutterWebAmapPlatform fakePlatform = MockFlutterWebAmapPlatform();
    FlutterWebAmapPlatform.instance = fakePlatform;

    expect(await flutterWebAmapPlugin.getPlatformVersion(), '42');
  });
}
