@JS('AMap')
library amap;

import 'package:js/js.dart';

// 经纬度坐标，用来描述地图上的一个点位置, 目前高德地图使用的是 GCJ-02 坐标，如果你采集的是 WGS84 坐标，请先进行坐标转换
// lng (Number?) 经度值
// lat (Number?) 纬度值
// noWrap (Boolean?) 是否自动将经度值修正到 [-180,180] 区间内，缺省时为false。
// noWrap 为false时传入 [190,30] ，会被自动修正为 [-170,30] , noWrap 为true时不会自动修正，可以用来进行跨日期限的覆盖物绘制
@JS()
class LngLat {
  external factory LngLat(
    num lng,
    num lat,
    bool noWrap,
  );

  external num getLng();

  external num getLat();
}
