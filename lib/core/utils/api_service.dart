import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    required String token,
    String? contentType,
  }) async {
    var response = await dio.post(url,data: body,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: headers ?? {"Authorization": "Bearer $token"},
    ),);
    return response;
  }
}
