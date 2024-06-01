import 'package:dio/dio.dart';
import 'package:kemet/models2/favorites_tourism.dart';


class TouristPlaceRepository {
  final Dio _dio = Dio();

  Future<List<TourismPlace>> fetchTouristPlaces() async {
    try {
      Response response = await _dio.get(
        'https://kemet-gp2024.onrender.com/api/v1/tourismPlaces',
      );

      List<TourismPlace> places = (response.data['document'] as List)
          .map((placeData) => TourismPlace.fromJson(placeData))
          .toList();

      return places;
    } catch (e) {
      print('Error fetching tourist places: $e');
      return []; // Return an empty list if there's an error
    }
  }
}

