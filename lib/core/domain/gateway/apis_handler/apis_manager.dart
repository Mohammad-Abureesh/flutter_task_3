library apis_manager;

import 'package:dio/dio.dart';
import 'package:flutter_task_3/core/utils/json_convertor.dart';

import '/core/constants/apis_routes.dart';
import '/core/utils/storage_utils.dart';
import 'api_response.dart';
import 'apis_handler.dart';

part 'api_token_service.dart';

abstract class ApisManager {
  static final Dio _dio = Dio(BaseOptions(baseUrl: ApisRoutes.baseApiUrl));

  Future<ApiResponse<R>> post<R>(
    String path, {
    dynamic data,
    ObjectConvertorFromJson<R>? convertor,
  }) async =>
      Handler<R>(
        onRequest: () => _dio.post(path, data: data),
        onReadData: (data) => convertor?.call(data),
      ).send;

  Future<ApiResponse<R>> get<R>(
    String path,
    ObjectConvertorFromJson<R> convertor,
  ) async =>
      Handler<R>(
          onRequest: () => _dio.get(path),
          onReadData: (data) => convertor.call(data)).send;

  Future<ApiResponse<List<R>>> getList<R>(
    String path,
    ObjectConvertorFromJson<R> convertor,
  ) async =>
      Handler<List<R>>(
          onRequest: () => _dio.get(path),
          onReadData: (data) => JsonConvertor<R>()
              .safeIterable(
                data,
                convertor,
              )
              .toList()).send;
}
