import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class Constants {
  static const String apiDomain = 'https://hawwa.failsafe.jp';
  static final logger = Logger();
  static final dio = Dio();
}
