@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

/// 比例尺插件。位于地图右下角，用户可控制其显示与隐藏。继承自 AMap.Control
@JS()
class Scale extends Control {
  external Scale(ControlConfig opts);
}
