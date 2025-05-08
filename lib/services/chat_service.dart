import 'package:dio/dio.dart';

class ChatService {
  final Dio _dio;

  ChatService(this._dio) {
    _dio.options.baseUrl = 'https://pocketlaw.easygrab.co.zw/api';
  }

  Future<String> sendMessage({required String deviceId, required String message}) async {
    final response = await _dio.post(
      '/bot',
      data: FormData.fromMap({
        'from': deviceId,
        'body': message,
      }),
    );

    if (response.statusCode == 200 && response.data != null) {
      return response.data['message'] as String;
    }
    throw Exception('Invalid response: \${response.statusCode}');
  }
}