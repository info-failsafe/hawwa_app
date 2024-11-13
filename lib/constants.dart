import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class Constants {
  static const String apiDomain = 'http://hawwa.local';
  static final logger = Logger();
  static final dio = Dio();
}
