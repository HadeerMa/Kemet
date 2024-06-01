import 'package:dio/dio.dart';
import 'package:kemet/models2/favorites_legand.dart';

class LegendRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://kemet-gp2024.onrender.com/api/v1';

  Future<List<Legands>> fetchLegends() async {
    try {
      final response = await _dio.get('$baseUrl/legends');
      final List<dynamic> data = response.data['document'];
      return data.map((json) => Legands.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load legends: $error');
    }
  }
}


