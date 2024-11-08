// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:js_util';
import 'dart:ui' as ui;

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_amap/js/amap.dart';
import 'package:flutter_web_amap/js/loader.dart';

typedef AMapController = AMap;

typedef AMapViewCreatedCallback = void Function(AMapController controller);

const String PLUGIN_GEO_LOCATION = 'AMap.Geolocation';

const String PLUGIN_AUTO_COMPLETE = 'AMap.AutoComplete';
const String PLUGIN_PLACE_SEARCH = 'AMap.PlaceSearch';

const String PLUGIN_SCALE = 'AMap.Scale';
const String PLUGIN_TOOL_BAR = 'AMap.ToolBar';
const String PLUGIN_CONTROL_BAR = 'AMap.ControlBar';
const String PLUGIN_MAP_TYPE = 'AMap.MapType';
const String PLUGIN_HAWK_EYE = 'AMap.HawkEye';

class AMapView extends StatefulWidget {
  const AMapView({
    super.key,
    required this.loaderOptions,
    this.mapOptions,
    this.onAMapViewCreated,
  });

  final LoaderOptions loaderOptions;
  final MapOptions? mapOptions;
  final AMapViewCreatedCallback? onAMapViewCreated;

  @override
  AMapViewState createState() => AMapViewState();
}

class AMapViewState extends State<AMapView> {
  late AMap _aMap;
  late String _divId;
  late DivElement _element;
  late LoaderOptions loaderOptions = widget.loaderOptions;
  late MapOptions mapOptions = widget.mapOptions ?? MapOptions(zoom: 14);

  void _onPlatformViewCreated() {
    final Object promise = load(loaderOptions) as Object;
    promiseToFuture<dynamic>(promise).then((_) {
      /// 无法使用id https://github.com/flutter/flutter/issues/40080
      _aMap = AMap(_element, mapOptions);
      widget.onAMapViewCreated?.call(_aMap);
    }, onError: (dynamic e) {
      print('初始化错误：$e');
    });
  }

  @override
  void dispose() {
    _aMap.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _divId = DateTime.now().toIso8601String();

    /// 先创建div并注册
    // ignore: undefined_prefixed_name,avoid_dynamic_calls
    ui.platformViewRegistry.registerViewFactory(_divId, (int viewId) {
      _element = DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.margin = '0';

      return _element;
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      /// 创建地图
      _onPlatformViewCreated();
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: _divId,
    );
  }
}
