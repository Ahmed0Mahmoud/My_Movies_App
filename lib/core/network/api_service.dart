import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://api.themoviedb.org/3/';
  final Dio dio;

  ApiService(this.dio);

  get({required String endpoint}) async {
    Response response = await dio.get('$baseUrl$endpoint');
    var data = response.data;
    return data;
  }
}
