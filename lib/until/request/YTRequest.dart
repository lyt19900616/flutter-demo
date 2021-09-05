import 'package:dio/dio.dart';
import 'Loading.dart';
import 'ResponseInterceptor.dart';
import 'Config.dart';

class YTRequest {
  static  final YTRequest _instance = YTRequest._internal();
  factory YTRequest() => _instance;
  Dio? _dio;

  YTRequest._internal({String baseUrl = ""}) {
    if (null == _dio) {
      _dio = Dio(BaseOptions(
        baseUrl: RequestConfig.baseUrl,
        connectTimeout: RequestConfig.timeout
      ));
      _dio?.interceptors.add(LogInterceptor());
      _dio?.interceptors.add(ResponseInterceptor());
    }
  }

  static YTRequest getInstance({String baseUrl = ""}) {
    if (baseUrl == "") {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  YTRequest _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio?.options.baseUrl = baseUrl;
    }
    return this;
  }

  YTRequest _normal() {
    if (_dio != null) {
      if (_dio?.options.baseUrl != RequestConfig.baseUrl) {
        _dio?.options.baseUrl = RequestConfig.baseUrl;
      }
    }
    return this;
  }

  get(api, {params, withLoading = true}) async {
    if (withLoading) {
      Loading.show();
    }
    Response response;

    try {
      response = await _dio!.get(api, queryParameters: params);
      if (withLoading) {
        Loading.hidden();
      }
      return response.data;
    } on DioError catch (err) {
      if (withLoading) {
        Loading.hidden();
      }
      return err;
    }
  }

  post(api, {params, withLoading = true}) async {
    if (withLoading) {
      Loading.show();
    }
    Response response;

    try {
      response = await _dio!.post(api, data: params);
      if (withLoading) {
        Loading.hidden();
      }
      return response.data;
    } on DioError catch (err) {
      if (withLoading) {
        Loading.hidden();
      }
      return err;
    }
  }
}