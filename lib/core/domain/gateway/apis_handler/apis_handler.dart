import 'package:dio/dio.dart';
import 'package:flutter_task_3/core/domain/gateway/apis_handler/dio_ext.dart';

import 'api_response.dart';

class Handler<R> {
  Handler({required this.onRequest, required this.onReadData});
  final Future<Response> Function() onRequest;
  final R? Function(dynamic data) onReadData;

  Future<ApiResponse<R>> get send async {
    ApiResponse<R> result = ApiResponse<R>();
    try {
      var response = await onRequest.call();
      if (response.success) {
        result
          ..success = response.success
          ..data = onReadData.call(response.data);
      }
      return result;
    } catch (e) {
      return result..error = e.toString();
    }
  }
}

extension IterableApiResponseExt<R> on ApiResponse<List<R>> {
  List<R> get elementsOrEmpty => dataOrDefault([]);
}

extension AsyncIterableApiResponseExt<R> on Future<ApiResponse<List<R>>> {
  Future<List<R>> get elementsOrEmpty async => (await this).elementsOrEmpty;
}
