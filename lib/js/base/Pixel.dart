@JS('AMap')
library amap;

import 'package:js/js.dart';

// 像素坐标，确定地图上的一个像素点。
@JS()
class Pixel {
  external Pixel(num x, num y);
}
