@JS('AMap')
library amap;

import 'package:flutter_web_amap/js/amap.dart';
import 'package:js/js.dart';

// 根据输入关键字提示匹配信息，可将Poi类型和城市作为输入提示的限制条件。
// https://lbs.amap.com/api/javascript-api-v2/documentation#autocomplete
@JS()
class AutoComplete {
  external AutoComplete(AutoOptions opts);

  //根据输入关键字提示匹配信息，支持中文、拼音
  external search(String keyword, ResultCallback<AutocompleteResult> callback);
}

// type 类型：string	输入提示时限定POI类型，多个类型用“|”分隔，目前只支持Poi类型编码如“050000” 默认值：所有类别
// city 类型：string	输入提示时限定城市。可选值：城市名（中文或中文全拼）、citycode、adcode；默认值：“全国”
// datatype 类型：string	返回的数据类型。可选值：all-返回所有数据类型、poi-返回POI数据类型、bus-返回公交站点数据类型、busline-返回公交线路数据类型目前暂时不支持多种类型
// citylimit 类型：boolean	是否强制限制在设置的城市内搜索,默认值为：false，true：强制限制设定城市，false：不强制限制设定城市
// input 类型：(string | HTMLDivElement)	可选参数，用来指定一个input输入框，设定之后，在input输入文字将自动生成下拉选择列表。支持传入输入框DOM对象的id值，或直接传入输入框的DOM对象。
// output 类型：(string | HTMLDivElement)	可选参数，指定一个现有的div的id或者元素，作为展示提示结果的容器，当指定了input的时候有效，缺省的时候将自动创建一个显示结果面板
// outPutDirAuto 类型：boolean	默认为true，表示是否在input位于页面较下方的时候自动将输入面板显示在input上方以避免被遮挡
// closeResultOnScroll 类型：boolean	页面滚动时关闭搜索结果列表，默认 true
// lang 类型：string	设置检索语言类型，默认中文 'zh_cn'
@JS()
@anonymous
class AutoOptions {
  external factory AutoOptions({
    String type,
    String city,
    String datatype,
    bool citylimit,
    String input,
    String output,
    bool outPutDirAuto,
    bool closeResultOnScroll,
    String lang,
  });
}

// info 类型：string	查询状态说明
// count 类型：number	输入提示条数
// tips 类型：Array<Tip>	输入提示列表
@JS()
@anonymous
class AutocompleteResult {
  external String get info;

  external int get count;

  external List<dynamic /*Tip*/ > get tips;
}

// name 类型：string	名称
// district 类型：string	所属区域
// adcode 类型：string	区域编码
@JS()
@anonymous
class Tip {
  external String get name;

  external String get district;

  external String get adcode;
}
