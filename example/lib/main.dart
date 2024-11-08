import 'package:flutter/material.dart';
import 'package:flutter_web_amap/amap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AMapView(
          loaderOptions: LoaderOptions(
            key: "21ddb39aa5593f6ebc311ec051441f06",
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

            GeolocationResult result = await executeAsync<GeolocationResult>(
                (callback) => geolocation.getCurrentPosition(callback));
            print(
                "当前位置:${result.position.getLat()} ${result.position.getLng()}");
          },
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
