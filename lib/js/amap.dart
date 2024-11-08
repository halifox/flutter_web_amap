// ignore_for_file: always_declare_return_types

@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/base/LngLat.dart';
import 'package:flutter_web_amap/js/base/Pixel.dart';
import 'package:flutter_web_amap/js/base/Size.dart';
import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

/// 高德地图js，文档：https://lbs.amap.com/api/javascript-api/guide/abc/prepare
@JS('Map')
class AMap {
  external AMap(dynamic /*String|DivElement*/ div, MapOptions opts);

  /// 重新计算容器大小
  external resize();

  /// 设置中心点
  //
  // 参数说明：
  // center (([number, number] | LngLat)) 中心点经纬度
  // immediately (Boolean = false) 是否立即过渡到目标位置
  // duration (Number?) 如果使用动画过度，动画过度的时长控制，单位 ms，默认值是内部自动计算的一个动态值。
  external setCenter(
    LngLat center,
    bool immediately,
    int? duration,
  );

  /// 设置地图显示的缩放级别，参数 zoom 可设范围：[2, 20]
  external setZoom(num zoom);

  /// 添加覆盖物/图层。参数为单个覆盖物/图层，或覆盖物/图层的数组。
  external add(dynamic /*Array<any> | Marker*/ features);

  /// 删除覆盖物/图层。参数为单个覆盖物/图层，或覆盖物/图层的数组。
  external remove(dynamic /*Array | Marker*/ features);

  /// 删除所有覆盖物
  external clearMap();

  /// 加载插件
  external plugin(dynamic /*String|List*/ name, void Function() callback);

  /// 添加控件，参数可以是插件列表中的任何插件对象，如：ToolBar、OverView、Scale等
  external addControl(Control control);

  /// 销毁地图，并清空地图容器
  external destroy();

  external on(String eventName, void Function(MapsEvent event) callback);
}

typedef ResultCallback<T> = Function(String status, T result);

@JS()
class Marker {
  external Marker(MarkerOptions opts);
}

@JS()
@anonymous
class MarkerOptions {
  external factory MarkerOptions({
    /// 要显示该marker的地图对象
    AMap map,

    /// 点标记在地图上显示的位置
    LngLat position,
    AMapIcon icon,
    String title,
    Pixel offset,
    String anchor,
  });

  external LngLat get position;

  external set position(LngLat v);
}

@JS()
@anonymous
class CircleOptions {
  external factory CircleOptions();
}

@JS('Icon')
class AMapIcon {
  external AMapIcon(IconOptions options);
}

@JS()
@anonymous
class MapsEvent {
  external LngLat get lnglat;
}

// https://lbs.amap.com/api/javascript-api-v2/documentation#map
// center 类型：([Number, Number] | LngLat)?	初始地图中心经纬度。
// zoom 类型：Number?	初始地图缩放级别。可以设置为浮点数；若 center 与 level 未赋值，地图初始化默认显示用户所在当前城市范围。
// rotation 类型：Number default0	初始地图顺时针旋转的角度，取值范围 [0-360] ，默认值：0
// pitch 类型：Number default0	初始地图俯仰角度，默认 0，最大值根据地图当前 zoom 级别不断增大， 2D 地图下无效 。
// viewMode 类型：String default'2D'	初始地图视图模式，默认为 2D ，可选 3D ，选择 3D 会显示 3D 地图效果。
// terrain 类型：Boolean defaultfalse	初始地图是否展示地形，此属性适用于 3D 地图。默认为值 false 不展示地形，可选 true ，选择 true 会展示地形效果。(注意：此属性适用于 JSAPI v2.1Beta 及以上版本)。
// features 类型：Array<String> default['bg','point','road','building']	设置地图上显示的元素种类, 支持 'bg' （地图背景）、 'point' （POI点）、 'road' （道路）、 'building' （建筑物）
// layers 类型：Array<Layer>	地图图层数组，数组可以是图层 中的一个或多个，默认为普通二维地图。当叠加多个图层，
// 如：' https://lbs.amap.com/api/jsapi-v2/documentation#tilelayer ' 时，普通二维地图需通过实例化一个 TileLayer 类实现。
// 如果你希望创建一个默认底图图层，使用 AMap.createDefaultLayer()；
// zooms 类型：[Number, Number] default[2,20]	地图显示的缩放级别范围, 默认为 [2, 20] ，取值范围 [2 ~ 26]
// dragEnable 类型：Boolean defaulttrue	地图是否可通过鼠标拖拽平移, 默认为 true 。此属性可被 setStatus/getStatus 方法控制
// zoomEnable 类型：Boolean defaulttrue	地图是否可缩放，默认值为 true 。此属性可被 setStatus/getStatus 方法控制
// jogEnable 类型：Boolean defaulttrue	地图是否使用缓动效果，默认值为 true 。此属性可被 setStatus/getStatus 方法控制
// pitchEnable 类型：Boolean defaulttrue	是否允许设置俯仰角度, 3D 视图下为 true , 2D 视图下无效。
// rotateEnable 类型：Boolean defaulttrue	地图是否可旋转, 图默认为 true 。
// animateEnable 类型：Boolean defaulttrue	地图平移过程中是否使用动画（如调用 panBy、panTo、setCenter、setZoomAndCenter 等函数, 将对地图产生平移操作, 是否使用动画平移的效果）, 默认为 true , 即使用动画
// keyboardEnable 类型：Boolean defaulttrue	地图是否可通过键盘控制, 默认为 true , 方向键控制地图平移，"+" 和 "-" 可以控制地图的缩放, Ctrl+“→”顺时针旋转，Ctrl+“←”逆时针旋转。此属性可被 setStatus/getStatus 方法控制
// doubleClickZoom 类型：Boolean defaulttrue	地图是否可通过双击鼠标放大地图, 默认为 true 。此属性可被 setStatus/getStatus 方法控制
// scrollWheel 类型：Boolean defaulttrue	地图是否可通过鼠标滚轮缩放浏览，默认为 true 。此属性可被 setStatus/getStatus 方法控制
// touchZoom 类型：Boolean defaulttrue	地图在移动终端上是否可通过多点触控缩放浏览地图，默认为 true 。关闭手势缩放地图，请设置为 false 。
// touchZoomCenter 类型：Boolean default1	可缺省，当 touchZoomCenter=1 的时候，手机端双指缩放的以地图中心为中心，否则默认以双指中间点为中心。
// showLabel 类型：Boolean defaulttrue	是否展示地图文字和 POI 信息。
// defaultCursor 类型：String?	地图默认鼠标样式。参数 defaultCursor 应符合 CSS 的 cursor 属性规范。
// isHotspot 类型：Boolean?	是否开启地图热点和标注的 hover 效果。PC端默认是 true , 移动端默认是 false 。
// mapStyle 类型：String?	设置地图的显示样式，目前支持两种地图样式：
// 第一种：自定义地图样式，如:
// amap://styles/d6bf8c1d69cea9f5c696185ad4ac4c86.
// 可前往地图自定义平台定制自己的个性地图样式；
// 第二种：官方样式模版，如：
// amap://styles/normal
// amap://styles/grey
// amap://styles/whitesmoke
// amap://styles/dark
// amap://styles/light
// amap://styles/graffiti.
// 其他模版样式及自定义地图的使用说明见开发指南。
// wallColor 类型：(String | Array<Number>)?	地图楼块的侧面颜色
// roofColor 类型：(String | Array<Number>)?	地图楼块的顶面颜色
// showBuildingBlock 类型：Boolean defaulttrue	是否展示地图 3D 楼块，默认 true 。
// showIndoorMap 类型：Boolean defaultfalse	是否自动展示室内地图，默认是 false 。
// skyColor 类型：(String | Array<Number>)?	天空颜色， 3D 模式下带有俯仰角时会显示
// labelRejectMask 类型：Boolean defaultfalse	文字是否拒绝掩模图层进行掩模
// mask 类型：Array<Number>	为 Map 实例指定掩模的路径，各图层将只显示路径范围内图像， 3D 视图下有效。 格式为一个经纬度的一维、二维或三维数组。
// [相关示例] 如：' https://lbs.amap.com/api/jsapi-v2/example/3d/mask '
// 一维数组时代表一个普通多边形路径，如:
// [[lng1,lat1], [lng2,lat2], [lng3,lat3]]. 二维数组时代表一个带洞的多边形路径，如:
// [[[lng4,lat4], [lng5,lat5], [lng6,lat6]], [[lng7,lat7], [lng8,lat8], [lng9,lat9]]]. 三维数组时代表多个多边形路径，如:
// [ [[lng1,lat1], [lng2,lat2], [lng3,lat3]], [ [[lng4,lat4], [lng5,lat5], [lng6,lat6]], [[lng7,lat7], [lng8,lat8], [lng9,lat9]] ] ].
// WebGLParams 类型：Object default{}	额外配置的 WebGL 参数 eg: preserveDrawingBuffer
@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    LngLat center,
    num zoom,
    int rotation,
    int pitch,
    bool viewMode,
    bool terrain,
    List<String> features,
    List<Layer> layers,
    List<int> zooms,
    bool dragEnable,
    bool zoomEnable,
    bool jogEnable,
    bool pitchEnable,
    bool rotateEnable,
    bool animateEnable,
    bool keyboardEnable,
    bool doubleClickZoom,
    bool scrollWheel,
    bool touchZoom,
    bool touchZoomCenter,
    bool showLabel,
    String defaultCursor,
    bool isHotspot,
    String mapStyle,
    dynamic /*String|List<String>*/ wallColor,
    dynamic /*String|List<String>*/ roofColor,
    bool showBuildingBlock,
    bool showIndoorMap,
    dynamic /*String|List<String>*/ skyColor,
    bool labelRejectMask,
    List<int> mask,
    dynamic WebGLParams,
  });

  external LngLat get center;

  external num get zoom;

  external String get viewMode;
}

@JS()
@anonymous
class IconOptions {
  external factory IconOptions({
    Size size,
    String image,
    Size imageSize,
  });
}

@JS()
@anonymous
class Layer {}
