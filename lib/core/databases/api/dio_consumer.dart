import 'package:clean_arch/core/databases/api/api_consumer.dart';
import 'package:clean_arch/core/databases/api/end_points.dart';
import 'package:clean_arch/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
  }

  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParams}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParams,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParams}) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParams,
      );
      return res.data;
    } on DioException catch (e) {
           handleDioException(e);

    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParams,
      bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParams,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParams,
      bool isFormData = false}) async {
    try {
      var res = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParams,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
