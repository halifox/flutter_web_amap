@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/control/Control.dart';
import 'package:js/js.dart';

//地图类型切换插件。用户通过该插件进行地图切换。
@JS()
class MapType extends Control {
  external MapType(MaptypeOptions opts);
}

// defaultType 类型：number default 0	初始化默认图层类型。 取值为0：默认底图 取值为1：卫星图 默认值：0
// showTraffic 类型：boolean default false	叠加实时交通图层 默认值：false
// showRoad 类型：boolean default false	叠加路网图层 默认值：false
@JS()
@anonymous
class MaptypeOptions {
  external factory MaptypeOptions({
    int defaultType,
    bool showTraffic,
    bool showRoad,
  });
}
