
import 'package:dio/dio.dart';
import '../config/dio_client.dart';

class AuthService {

Future<Map<String, dynamic>> login({
  required String usuario,
  required String password,
}) async {
  try {
    final response = await DioClient.dio.post(
      '/auth/login',
      data: {
        'usuario': usuario,
        'password': password,
      },
    );
    return response.data;

  } on DioException catch (e) {

    throw Exception(
      e.response?.data['message'] ??
      'Error de conexión'
    );

  }
}
}