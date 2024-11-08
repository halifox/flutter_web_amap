@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/amap.dart';
import 'package:js/js.dart';

//切片图层类，该类为基础类。
@JS()
class TileLayer {
  external TileLayer(TileLayerOptions opts);

  external setMap(AMap map);

  external setTileUrl(String url);

  external reload();

  external hide();

  external show();
}

// tileUrl 类型：String	切片取图地址 如：' https://abc{0,1,2,3}.amap.com/tile?x=[x]&y=[y]&z=[z] ' [x] 、 [y] 、 [z] 分别替代切片的xyz。
// zooms 类型：[Number, Number]default [2,30]	支持的缩放级别范围，默认范围 [2-30]
// dataZooms 类型：[Number, Number]default [2,30]	数据支持的缩放级别范围，默认范围 [2-30]
// opacity 类型：Numberdefault 1	透明度，默认 1
// visible 类型：Booleandefault true	是否显示，默认 true
// zIndex 类型：Numberdefault 4	图层叠加的顺序值，1 表示最底层。默认 zIndex：4
// tileSize 类型：Numberdefault 256	切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
@JS()
@anonymous
class TileLayerOptions {
  external factory TileLayerOptions({
    String tileUrl,
    List<int> zooms,
    List<int> dataZooms,
    int opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}

///实时交通图层类

@JS("TileLayer.Traffic")
class Traffic extends TileLayer {
  external Traffic(TrafficLayerOptions opts);
}

// autoRefresh 类型：Boolean	是否自动更新数据，默认开启
// interval 类型：Number	自动更新数据的间隔毫秒数，默认 180ms
// zooms 类型：[Number, Number] default [2,30]	支持的缩放级别范围，默认范围 [2-30]
// opacity 类型：Number default 1	透明度，默认 1
// visible 类型：Boolean default true	是否显示，默认 true
// zIndex 类型：Number default 4	图层叠加的顺序值，1 表示最底层。默认 zIndex：4
// tileSize 类型：Number default 256	切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
@JS()
@anonymous
class TrafficLayerOptions {
  external factory TrafficLayerOptions({
    bool autoRefresh,
    int interval,
    List<int> zooms,
    int opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}

///卫星图层类

@JS("TileLayer.Satellite")
class Satellite extends TileLayer {
  external Satellite(SatelliteLayerOptions opts);
}

// zooms 类型：[Number, Number] default [2,30]	支持的缩放级别范围，默认范围 [2-30]
// opacity 类型：Number default 1	透明度，默认 1
// visible 类型：Boolean default true	是否显示，默认 true
// zIndex 类型：Number default 4	图层叠加的顺序值，1 表示最底层。默认 zIndex：4
// tileSize 类型：Number default 256	切片大小，取值：
// 256，表示切片大小为256 256，
// 128，表示切片大小为128 128，
// 64，表示切片大小为64*64。默认值为256
@JS()
@anonymous
class SatelliteLayerOptions {
  external factory SatelliteLayerOptions({
    List<int> zooms,
    int opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}

/// 路网图层
@JS("TileLayer.RoadNet")
class RoadNet extends TileLayer {
  external RoadNet(RoadnetLayerOptions opts);
}

// zooms 类型：[Number, Number] default [2,30]	支持的缩放级别范围，默认范围 [2-30]
// opacity 类型：Number default 1	透明度，默认 1
// visible 类型：Boolean default true	是否显示，默认 true
// zIndex 类型：Number default 4	图层叠加的顺序值，1 表示最底层。默认 zIndex：4
// tileSize 类型：Number default 256	切片大小，取值：
// 256，表示切片大小为256 256，
// 128，表示切片大小为128 128，
// 64，表示切片大小为64*64。默认值为256
@JS()
@anonymous
class RoadnetLayerOptions {
  external factory RoadnetLayerOptions({
    List<int> zooms,
    int opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}

/// 建筑楼块 3D 图层
@JS()
class Buildings extends TileLayer {
  external Buildings(BuildingLayerOpts opts);
}

// wallColor 类型：(Array<String> | String)	楼块侧面颜色，支持 rgba、rgb、十六进制等
// roofColor 类型：(Array<String> | String)	楼块顶面颜色，支持 rgba、rgb、十六进制等
// heightFactor 类型：Number	楼块的高度系数因子，默认为 1，也就是正常高度
// styleOpts 类型：BuildingStyleOptions	楼块的围栏和样式设置
// zooms 类型：[Number, Number] default [2,20]	图层缩放等级范围，默认 [2, 20]
// opacity 类型：Number default 1	图层透明度，默认为 1
// visible 类型：Boolean default true	图层是否可见，默认为 true
// zIndex 类型：Number default 11	图层的层级，默认为 11
@JS()
@anonymous
class BuildingLayerOpts {
  external factory BuildingLayerOpts({
    List<String> wallColor,
    List<String> roofColor,
    int heightFactor,
    dynamic styleOpts,
    List<int> zooms,
    int opacity,
    bool visible,
    int zIndex,
  });
}

/// DistrictLayer
@JS()
class DistrictLayer extends TileLayer {
  external DistrictLayer(DistrictLayerOptions opts);
}

// adcode 类型：String	行政区的编码 adcode与省市行政区对照表
// SOC 类型：String default 'CHN'	设定显示的国家 SOC 国家代码、名称、Bounds对照表下载
// depth 类型：Number default 0	设定数据的层级深度，depth为0的时候只显示国家面，depth为1的时候显示省级， 当国家为中国时设置depth为2的可以显示市一级
// zIndex 类型：Number default 80	图层的层级，默认为 80
// opacity 类型：Number default 1	图层透明度，默认为 1
// visible 类型：Boolean default true	图层是否可见，默认为 true
// zooms 类型：[number, number] default [2,20]	图层缩放等级范围，默认 [2, 20]
// styles 类型：DistrictLayerStyle	为简易行政区图设定各面的填充颜色和描边颜色。 styles各字段的值可以是颜色值，也可以是一个返回颜色值* 的回调函数function。支持的颜色格式有：
// 1. #RRGGBB，如：'#FFFFFF'
// 2. rgba()，如：'rgba(255,255,255,1)'
// 3. rgb()，如：'rgb(255,255,255)'
// 4. [r,g,b,a] ，如： [1,1,1,1]
// 5. ''，代表不赋予颜色
// styles.stroke-width 类型：(Number | Function) default 1	描边线宽
// styles.zIndex 类型：(Number | Function) default 0	图层中每个区域层级，数值越大，层级越高
// styles.coastline-stroke 类型：(Array<String> | String | Function) default [0.18,0.63,0.94,1]	海岸线颜色
// styles.nation-stroke 类型：(Array<String> | String | Function) default [0.35,0.35,0.35,1]	国境线颜色
// styles.province-stroke 类型：(Array<String> | String | Function) default [0.5,0.5,0.5,1]	省界颜色
// styles.city-stroke 类型：(Array<String> | String | Function) default [0.7,0.7,0.7,1]	城市界颜色
// styles.county-stroke 类型：(Array<String> | String | Function) default [0.85,0.85,0.85,1]	区/县界颜色
// styles.fill 类型：(Array<String> | String | Function) default [1,1,1,1]	填充色
@JS()
@anonymous
class DistrictLayerOptions {
  external factory DistrictLayerOptions({
    String adcode,
    String SOC,
    int depth,
    int zIndex,
    int opacity,
    bool visible,
    List<int> zooms,
    dynamic styles,
  });
}

/// 室内图层，用于在适当级别展示室内地图，并提供显示商铺tip、切换楼层等功能。
@JS()
class IndoorMap extends TileLayer {
  external IndoorMap(IndoorMapOptions opts);
}

// zIndex 类型：Number	室内图层叠加的顺序值
// opacity 类型：Number	图层的透明度，取值范围 [0,1]
// cursor 类型：String	指定鼠标悬停到店铺面时的鼠标样式
// hideFloorBar 类型：Boolean	是否隐藏楼层切换控件，默认值：false
@JS()
@anonymous
class IndoorMapOptions {
  external factory IndoorMapOptions({
    int zIndex,
    int opacity,
    String cursor,
    bool hideFloorBar,
  });
}
