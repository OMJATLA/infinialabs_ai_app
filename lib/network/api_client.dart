import 'dart:io' as io;
import 'package:dio/dio.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_local_repository.dart';
import 'package:infinialabs_ai/network/config_constants.dart';
import 'package:infinialabs_ai/helper/snackbar_helper.dart';
import 'package:infinialabs_ai/network/http_method.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:infinialabs_ai/utils/app_constants.dart';
import 'package:infinialabs_ai/utils/logger.dart';

class ApiClient {
  const ApiClient._();

  static final Dio _dio =
      Dio(BaseOptions(baseUrl: ConfigConstants.baseUrl))
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: _requestInterception,
            onResponse: _responseInterception,
            onError: _errorInterception,
          ),
        )
        ..interceptors.add(CurlLoggerDioInterceptor());

  static final _authLocalRepo = AuthLocalRepository();

  static dynamic _requestInterception(
    RequestOptions requestOptions,
    RequestInterceptorHandler requestInterceptorHandler,
  ) async {
    Logger.printInDebug('${requestOptions.method} ${requestOptions.path}');
    if (requestOptions.headers[AppConstants.authorization] == null) {
      final token = await _getAuthorizationToken(requestOptions.uri.path);
      if (token != null) {
        requestOptions.headers[AppConstants.authorization] = token;
      }
    }
    requestInterceptorHandler.next(requestOptions);
  }

  static _responseInterception(
    Response<dynamic> response,
    ResponseInterceptorHandler responseInterceptorHandler,
  ) {
    Logger.printInDebug('(${response.statusCode}) ${response.realUri.path}');
    responseInterceptorHandler.next(response);
  }

  static _errorInterception(
    DioException dioException,
    ErrorInterceptorHandler errorInterceptorHandler,
  ) {
    Logger.printInDebug(
      '${dioException.requestOptions.uri}  ${dioException.toString()}',
    );
    if (dioException.error is io.SocketException) {
      SnackbarHelper.showNoInternetSnackBar();
    }
    errorInterceptorHandler.next(dioException);
  }

  static Future<String?> _getAuthorizationToken(String url) async {
    if (addAccessTokenUrls.contains(url)) {
      return await _authLocalRepo.getAuthToken();
    }
    return null;
  }

  static const addAccessTokenUrls = ['/user/getuserprofile'];

  static Future<dynamic> request({
    required String endpoint,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    String errorMsg = AppConstants.somethingWentWrng,
  }) async {
    try {
      final response = await _dio.request(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(method: method.name, headers: headers),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } on Exception catch (e) {
      Logger.printInDebug(e);
    }

    throw Exception(errorMsg);
  }
}
