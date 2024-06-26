import 'package:bias_user/services/auth_service.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    print('\n');
    print('--> ${options.method.toUpperCase()} ${'' + (options.baseUrl) + (options.path)}');
    print('Headers:');
    options.headers.forEach((k, dynamic v) => print('$k: $v'));
    print('queryParameters:');
    options.queryParameters.forEach((k, dynamic v) => print('$k: $v'));
    if (options.data != null) {
      print('Body: ${options.data.toString()}');
    }
    print('--> END ${options.method.toUpperCase()}');
    handler.next(options);
  }

  @override
  void onError(
    DioError err, 
    ErrorInterceptorHandler handler
  ) {
    print('\n');
    print('<-- ${err.message} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}');
    print('${err.response != null ? err.response!.data : 'Unknown Error'}');
    print('<-- End error');
    if(err.response?.statusCode == 401 && !err.requestOptions.uri.path.contains('/auth/get_tokens')) {
      AuthService.to.logout();
    } else {
      handler.next(err);
    }
  }

  @override
  void onResponse(
    Response<dynamic> response, 
    ResponseInterceptorHandler handler
  ) {
    print('\n\n');
    print('<--- HTTP CODE : ${response.statusCode} URL : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    print('Headers: ');
    printWrapped('Response : ${response.data}');
    print('<--- END HTTP');
    handler.next(response);
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((RegExpMatch match) => print(match.group(0)));
  }
}
