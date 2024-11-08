@JS('AMap')
library amap;

import 'package:js/js.dart';

// 固定于地图最上层的用于控制地图某些状态的 DOM 组件类型
@JS()
class Control {
  external Control(ControlConfig opts);

  external show();

  external hide();
}

// position 类型：(string | object)	控件停靠位置 { top: 5; left: 5; right: 5; bottom: 5 } 或者 'LT': 左上角, 'RT': 右上角, 'LB': 左下角, 'RB': 右下角
// offset 类型：[number, number]	相对于地图容器左上角的偏移量，正数代表向右下偏移。默认为AMap.Pixel(10,10)
@JS()
@anonymous
class ControlConfig {
  external factory ControlConfig({
    String position,
    List<num> offset,
  });
}
