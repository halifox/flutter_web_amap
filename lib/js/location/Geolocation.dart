@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/amap.dart';
import 'package:flutter_web_amap/js/base/LngLat.dart';
import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

///AMap.Geolocation 定位服务插件。融合了浏览器定位、高精度IP定位、安卓定位sdk辅助定位等多种手段，提供了获取当前准确位置、获取当前城市信息、持续定位(浏览器定位)等功能。
///用户可以通过两种当时获得定位的成败和结果，一种是在 getCurrentPosition的时候传入回调函数来处理定位结果，一种是通过事件监听来取得定位结果。
@JS()
class Geolocation extends Control {
  external Geolocation(GeolocationOptions opts);

  ///获取 用户的精确位置，有失败几率
  external getCurrentPosition(ResultCallback<GeolocationResult> callback);
}

/// https://a.amap.com/jsapi/static/doc/20230922/index.html#geolocation
/// position 类型：string	悬停位置，默认为"RB"，即右下角
/// offset 类型：[number, number]	缩略图距离悬停位置的像素距离，如 [2,2]
/// borderColor 类型：string	按钮边框颜色值，同CSS，如'silver'
/// borderRadius 类型：string	按钮圆角边框值，同CSS，如'5px'
/// buttonSize 类型：string	箭头按钮的像素尺寸，同CSS，如'12px'
/// convert 类型：boolean	是否将定位结果转换为高德坐标
/// enableHighAccuracy 类型：boolean	进行浏览器原生定位的时候是否尝试获取较高精度，可能影响定位效率，默认为false
/// timeout 类型：number	定位的超时时间，毫秒
/// maximumAge 类型：number	浏览器原生定位的缓存时间，毫秒
/// showButton 类型：boolean	是否显示定位按钮，默认为true
/// showCircle 类型：boolean	是否显示定位精度圆，默认为true
/// showMarker 类型：boolean	是否显示定位点，默认为true
/// markerOptions 类型：MarkerOptions	定位点的样式
/// circleOptions 类型：CircleOptions	定位圆的样式
/// panToLocation 类型：boolean	定位成功后是否自动移动到响应位置
/// zoomToAccuracy 类型：boolean	定位成功后是否自动调整级别
/// GeoLocationFirst 类型：boolean	优先使用H5定位，默认移动端为true，PC端为false
/// noIpLocate 类型：number	是否禁用IP精确定位，默认为0，0:都用 1:手机上不用 2:PC上不用 3:都不用
/// noGeoLocation 类型：number	是否禁用浏览器原生定位，默认为0，0:都用 1:手机上不用 2:PC上不用 3:都不用
/// useNative 类型：boolean	是否与高德定位SDK能力结合，需要同时使用安卓版高德定位sdk，否则无效
/// getCityWhenFail 类型：boolean	定位失败之后是否返回基本城市定位信息
/// needAddress 类型：boolean	是否需要将定位结果进行逆地理编码操作
/// extensions 类型：string	是否需要详细的逆地理编码信息，默认为'base'只返回基本信息，可选'all'
@JS()
@anonymous
class GeolocationOptions {
  external factory GeolocationOptions({
    String position,
    List<int> offset,
    String borderColor,
    String borderRadius,
    String buttonSize,
    bool convert,
    bool enableHighAccuracy,
    int timeout,
    int maximumAge,
    bool showButton,
    bool showCircle,
    bool showMarker,
    MarkerOptions markerOptions,
    CircleOptions circleOptions,
    bool panToLocation,
    bool zoomToAccuracy,
    bool GeoLocationFirst,
    int noIpLocate,
    int noGeoLocation,
    bool useNative,
    bool getCityWhenFail,
    bool needAddress,
    String extensions,
  });
}

/// 浏览器定位的定位结果，定位的过程和失败信息可以从 message 字段中获取
/// 文档中的类型有误： https://a.amap.com/jsapi/static/doc/20230922/index.html#geolocationresult
/// position (LngLat) : 定位到的经纬度位置
/// accuracy (number) : 定位精度，米
/// location_type (number) : 定位的类型，ip/h5/sdk/ipcity
/// message (number) : 定位过程的信息，用于排查定位失败原因
/// isConverted (number) : 是否已经转换为高德坐标
/// info (number) : 'SUCCESS' 或者 'PERMISSION_DENIED' 或者 'TIME_OUT' 或者 'POSITION_UNAVAILABLE'
/// addressComponent (number) : needAddress的时候返回，结构化地址信息
/// formattedAddress (number) : needAddress的时候返回，规范地址
/// pois (number) : needAddress的时候返回，定位点附近的POI信息
/// roads (number) : needAddress的时候返回，定位点附近的道路信息
/// crosses (number) : needAddress的时候返回，定位点附近的交叉口信息
@JS()
@anonymous
class GeolocationResult {
  external LngLat get position;

  external int get accuracy;

  external String get location_type;

  external String get message;

  external bool get isConverted;

  external String get info;

  external dynamic get addressComponent;

  external dynamic get formattedAddress;

  external dynamic get pois;

  external dynamic get roads;

  external dynamic get crosses;
}
