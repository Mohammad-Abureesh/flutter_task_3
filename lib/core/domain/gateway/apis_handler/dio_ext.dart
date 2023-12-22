import 'package:dio/dio.dart';

extension DioResExt<R> on Response<R> {
  bool get success => statusCode.toString().startsWith('2');
}
