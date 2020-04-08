import 'package:dio/native_imp.dart';
import 'package:mobx_slidy_example/app/shared/dio/interceptors/log_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    interceptors.add(LogInterceptor());
  }
}