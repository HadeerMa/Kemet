import 'package:dio/dio.dart';

import '../models2/favorites_tourism.dart';

class GovernatesRepository {
  final Dio _dio = Dio();
  final String baseUrl;

  GovernatesRepository({required this.baseUrl});

  Future<List<Governate>> fetchGovernates() async {
    try {
      Response response = await _dio.get('$baseUrl/governrates');

      if (response.statusCode == 200) {
        final List<dynamic> governatesData = response.data['document'];

        List<Governate> governates = governatesData.map((item) {
          return Governate.fromJson(item);
        }).toList();

        return governates;
      } else {
        throw Exception('Failed to load governates');
      }
    } catch (e) {
      throw Exception('Failed to fetch governates: $e');
    }
  }
}
