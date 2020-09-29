import 'package:api_example_two/model/news_response.dart';
import 'package:api_example_two/utils/logging_interceptor.dart';
import 'package:dio/dio.dart';

class NewsApiProvider {
  final String _endpoint =
      "https://gb-mobile-app-teste.s3.amazonaws.com/data.json";
  Dio _dio;

  NewsApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<NewsResponse> getNews() async {
    try {
      Response response = await _dio.get(_endpoint);
      return NewsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewsResponse.withError(_handleError(error));
    }
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
          "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
