@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/amap.dart';
import 'package:flutter_web_amap/js/base/Bounds.dart';
import 'package:flutter_web_amap/js/base/LngLat.dart';
import 'package:js/js.dart';

/// 地点搜索服务插件，提供某一特定地区的位置查询服务。
/// https://lbs.amap.com/api/javascript-api-v2/documentation#placesearch
@JS()
class PlaceSearch {
  external PlaceSearch(PlaceSearchOptions opts);

  //根据输入关键字提示匹配信息，支持中文、拼音
  //
  // 参数说明：
  // keyword (string) 关键字
  // callback (searchCallback) 搜索结果回调
  external search(String keyword, ResultCallback<SearchResult> callback);

  //根据范围和关键词进行范围查询
  //
  // 参数说明：
  // keyword (string) 关键词
  // bounds (AMap.Bounds) 范围
  // callback (searchCallback) 搜索结果回调
  external searchInBounds(String keyWord, Bounds bounds, ResultCallback<SearchResult> callback);

  //根据中心点经纬度、半径以及关键字进行周边查询 radius取值范围：0-50000
  //
  // 参数说明：
  // keyword (string) 关键字
  // center (AMap.LngLat) 中心点经纬度
  // radius (number) 半径
  external searchNearBy(String keyword, LngLat center, num radius, ResultCallback<SearchResult> callback);
}

// city: "北京", //城市
// type: "", //数据类别
// pageSize: 10, //每页结果数,默认10
// pageIndex: 1, //请求页码，默认1
// extensions: "base" //返回信息详略，默认为base（基本信息） | all，返回基本+详细信息
@JS()
@anonymous
class PlaceSearchOptions {
  external factory PlaceSearchOptions({
    String city,
    String type,
    int pageSize,
    int pageIndex,
    String extensions,
  });
}

/// info 类型：string	成功状态说明
/// keywordList 类型：Array<keyword>	发生事件且查无此关键字时，返回建议关键字列表，可根据建议关键字查询
/// cityList 类型：Array<cityInfo>	发生事件且查无此关键字且 city 为“全国”时，返回城市建议列表，该列表中每个城市包含一个或多个相关Poi点信息
/// poiList 类型：object	发生事件时返回兴趣点列表
@JS()
@anonymous
class SearchResult {
  external String get info;

  external List<dynamic /*String*/ > get keywordList;

  external List<dynamic /*CityInfo*/ > get cityList;

  external PoiList get poiList;
}

/// name 类型：string	建议城市名称
/// citycode 类型：string	城市编码
/// adcode 类型：string	行政区编码
/// count 类型：string	该城市的建议结果数目
@JS()
@anonymous
class CityInfo {
  external String get name;

  external String get citycode;

  external String get adcode;

  external String get count;
}

// pageIndex 类型：number	页码
// pageSize 类型：number	单页结果数
// count 类型：number	查询结果总数
// pois 类型：Array<POI>	Poi列表
@JS()
@anonymous
class PoiList {
  external int get pageIndex;

  external int get pageSize;

  external int get count;

  external List<dynamic /*Poi*/ > get pois;
}

// id 类型：string	兴趣点id
// name 类型：string	名称
// type 类型：string	兴趣点类型
// location 类型：LngLat	兴趣点经纬度
// address 类型：string	地址
// distance 类型：number	离中心点距离，仅周边查询返回
// tel 类型：string	电话
// website 类型：string	网址
// pcode 类型：string	poi所在省份编码
// citycode 类型：string	poi所在城市编码
// adcode 类型：string	poi所在区域编码
// postcode 类型：string	邮编
// pname 类型：string	poi所在省份
// cityname 类型：string	poi所在城市名称
// adname 类型：string	poi所在行政区名称
// email 类型：string	电子邮箱
// entr_location 类型：LngLat	入口经纬度，POI点有出入口信息时返回，否则返回空字符串
// exit_location 类型：LngLat	出口经纬度，POI点有出入口信息时返回，否则返回空字符串
@JS()
@anonymous
class Poi {
  external String get id;

  external String get name;

  external String get type;

  external LngLat get location;

  external String get address;

  external int get distance;

  external String get tel;

  external String get website;

  external String get pcode;

  external String get citycode;

  external String get adcode;

  external String get postcode;

  external String get pname;

  external String get cityname;

  external String get adname;

  external String get email;

  external LngLat get entr_location;

  external LngLat get exit_location;
}
