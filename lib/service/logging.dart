import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Logging extends Interceptor{
  @override
  void onRequest (RequestOptions options, RequestInterceptorHandler handler){
    print("REQUEST ${options.method} => ${options.path}");
    EasyLoading.show(status: 'loading...');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse (Response response, ResponseInterceptorHandler handler){
    print("RESPONSE ${response.statusCode} => ${response.requestOptions.path}");
    EasyLoading.dismiss();
    return super.onResponse(response, handler);
  }
}