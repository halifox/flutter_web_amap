@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

//地图操作工具条插件。可支持方向导航、位置定位、视野级别缩放、视野级别选择等操作。继承自 AMap.Control
@JS()
class ToolBar extends Control {
  external ToolBar(ControlConfig opts);
}
