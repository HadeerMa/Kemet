
import '../screens/torist_place.dart'; // Import your service to fetch data

// Define states
abstract class TouristPlacesState {}

class TouristPlacesLoading extends TouristPlacesState {}

class TouristPlacesLoaded extends TouristPlacesState {
  final List<TouristPlace> places;

  TouristPlacesLoaded(this.places);
}

class TouristPlacesError extends TouristPlacesState {
  final String message;

  TouristPlacesError(this.message);
}

