@JS('AMap')
library amap;

import 'package:js/js.dart';

// 地物对象的像素尺寸
@JS()
class Size {
  external Size(num width, num height);
}
