@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

// 鹰眼控件，用于显示缩略地图，显示于地图右下角，可以随主图的视口变化而变化，也可以配置成固定位置实现类似于南海附图的效果。
@JS()
class HawkEye extends Control {
  external HawkEye(HawkEyeConfig opts);
}

// autoMove 类型：boolean	是否随主图视口变化移动
// showRectangle 类型：boolean	是否显示视口矩形
// showButton 类型：boolean	是否显示打开关闭的按钮
// opened 类型：boolean	默认是否展开
// mapStyle 类型：string	缩略图要显示的地图自定义样式，如'amap://styles/dark'
// layers 类型：array	缩略图要显示的图层类型，默认为普通矢量地图
// width 类型：string	缩略图的宽度，同CSS，如'200px'
// height 类型：string	缩略图的高度，同CSS，如'200px'
// offset 类型：[number, number]	缩略图距离地图右下角的像素距离，如 [2,2]
// borderStyle 类型：string	缩略图的边框样式，同CSS，如"double solid solid double"
// borderColor 类型：string	缩略图的边框颜色，同CSS，如'silver'
// borderRadius 类型：string	缩略图的圆角半径，同CSS，如'5px'
// borderWidth 类型：string	缩略图的边框宽度，同CSS，如'2px'
// buttonSize 类型：string	缩略图的像素尺寸，同CSS，如'12px'
@JS()
@anonymous
class HawkEyeConfig {
  external factory HawkEyeConfig({
    bool autoMove,
    bool showRectangle,
    bool showButton,
    bool opened,
    String mapStyle,
    List<int> layers,
    String width,
    String height,
    int offset,
    String borderStyle,
    String borderColor,
    String borderRadius,
    String borderWidth,
    String buttonSize,
  });
}
