import 'dart:async';

import 'package:flutter_web_amap/js/amap.dart';
import 'package:js/js.dart';

/// `executeAsync` 是一个异步函数，接受一个操作回调作为参数，执行该操作并根据返回的状态处理结果。
/// 该函数使用 `Completer` 来管理异步操作的结果，最终返回一个 `Future<T>` 对象。
/// 支持三种状态：`complete`、`no_data` 和 `error`，分别对应操作成功完成、没有数据以及出错的情形。
Future<T> executeAsync<T>(
  Function(ResultCallback<T> callback) operation,
) async {
  Completer<T> completer = Completer<T>();
  operation(
    allowInterop((String status, dynamic /* T|??|String */ result) {
      switch (status) {
        case 'complete':
          if (result is T) {
            completer.complete(result);
          } else {
            // print(result.runtimeType);//LegacyJavaScriptObject
            print(status);
            print(result);
          }
          break;
        case 'no_data':
          completer.complete(null);
          break;
        case 'error':
          if (result is String) {
            completer.completeError(result);
          } else {
            // print(result.runtimeType);
            print(status);
            print(result);
            completer.completeError(result.toString());
          }
          break;
        default:
          print(status);
          print(result);
          completer.completeError("status:$status");
          break;
      }
    }),
  );
  return completer.future;
}
