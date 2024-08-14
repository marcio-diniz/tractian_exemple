import 'package:dio/dio.dart';

abstract class IDioClientService {
  Future<Response> get({
    required String url,
  });
}
