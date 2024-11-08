@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

//地图操作工具条插件。可支持方向导航、位置定位、视野级别缩放、视野级别选择等操作。继承自 AMap.Control
@JS()
class ControlBar extends Control {
  external ControlBar(ControlBarConfig opts);
}

// position 类型：(string | object)	控件停靠位置 { top: 5; left: 5; right: 5; bottom: 5 } 或者 'LT': 左上角, 'RT': 右上角, 'LB': 左下角, 'RB': 右下角
// offset 类型：[number, number]	相对于地图容器左上角的偏移量，正数代表向右下偏移。默认为AMap.Pixel(10,10)
// showControlButton 类型：boolean	是否显示倾斜、旋转按钮。默认为 true
@JS()
@anonymous
class ControlBarConfig {
  external factory ControlBarConfig({
    String position,
    List<num> offset,
    bool showControlButton,
  });
}
