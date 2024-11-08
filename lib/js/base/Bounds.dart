@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/base/LngLat.dart';
import 'package:js/js.dart';

//地物对象的经纬度矩形范围。
// southWest (LngLat) 西南角经纬度
// northEast (LngLat) 东北角经纬度值
@JS()
@anonymous
class Bounds {
  external factory Bounds({
    LngLat southWest,
    LngLat northEast,
  });

  //获取西南角坐标。
  external LngLat getSouthWest();

  //获取东北角坐标
  external LngLat getNorthEast();

  //获取西北角坐标
  external LngLat getNorthWest();

  //获取东南角坐标
  external LngLat getSouthEast();

  //获取当前Bounds的中心点经纬度坐标。
  external LngLat getCenter();

  //指定点坐标是否在矩形范围内
  external bool contains(LngLat lngLat);
}
