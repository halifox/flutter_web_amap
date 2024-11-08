# 高德地图 Flutter Web 端插件

本插件是一个基于高德地图的 Flutter Web 专用插件，**专为仅在 Web 平台运行的 Flutter 项目设计。** 通过此插件，可轻松在 Flutter Web 应用中嵌入和控制高德地图功能。

## 使用方法

### 1. 在 `web/index.html` 中引入高德地图 JavaScript SDK

在项目的 `web/index.html` 文件中添加以下代码，以引入高德地图 SDK 和安全配置：

```html
<script type="text/javascript">
    window._AMapSecurityConfig = {
        securityJsCode: "2e56e0f9d5090b93cb8d25e2de7afb00",// 替换为你的高德地图 API 密钥
    };
</script>
<script src="https://webapi.amap.com/loader.js"></script>
```

### 2. 创建并初始化地图控件

在 Flutter 项目中使用 `AMapView` 组件来创建和初始化地图视图。以下是一个简单的示例：

```dart
AMapView(
  loaderOptions: LoaderOptions(
    key: "21ddb39aa5593f6ebc311ec051441f00",// 替换为你的高德地图 API Key
    version: '2.0',
    plugins: [
      PLUGIN_GEO_LOCATION,
      PLUGIN_PLACE_SEARCH,
      PLUGIN_SCALE,
      PLUGIN_TOOL_BAR,
      PLUGIN_AUTO_COMPLETE,
    ],
  ),
  onAMapViewCreated: (AMapController controller) async {
    Scale scale = Scale(ControlConfig());
    controller.addControl(scale);

    Geolocation geolocation = Geolocation(GeolocationOptions());
    controller.addControl(geolocation);

    GeolocationResult result = await executeAsync<GeolocationResult>((callback) => geolocation.getCurrentPosition(callback));
    print("当前位置:${result.position.getLat()} ${result.position.getLng()}");
  },
)
```

[示例代码](example/lib/main.dart)

### 文档

[高德开放平台-参考手册](https://lbs.amap.com/api/javascript-api-v2/documentation)

### 工具函数

1. `Future<T> executeAsync<T>(Function(ResultCallback<T> callback) operation)`

高德地图 JavaScript API 主要通过回调的方式返回结果，`executeAsync` 函数可以将这些回调封装为异步方法，使代码更符合 Dart 的异步编程风格。这对于需要等待回调结果的操作（例如定位获取、路径规划）尤为方便。

```dart
Geolocation geolocation = Geolocation(GeolocationOptions());

GeolocationResult result = await executeAsync<GeolocationResult>((callback) => 
  geolocation.getCurrentPosition(callback)
);

print("Latitude: ${result.position.getLat()}, Longitude: ${result.position.getLng()}");
```

### 注意事项

- **安全配置**：确保 `securityJsCode` 和 `key` 值为您在高德平台申请的合法凭证。
- **Web 支持**：该插件仅支持 Web 端使用，确保项目的 `index.html` 文件正确加载高德地图的 JavaScript SDK。

### License

```
Copyright 2019 Square, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
