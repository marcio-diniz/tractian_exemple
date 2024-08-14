import 'package:dio/dio.dart';
import 'package:tractian_exemple/infra/services/i_dio_client_service.dart';

class DioClientService implements IDioClientService {
  final _client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  @override
  Future<Response> get({
    required String url,
  }) async {
    return _client.get(
      url,
    );
  }
}
