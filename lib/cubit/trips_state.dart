
import '../screens/trips.dart';
//import 'package:your_app/models/trip.dart'; // Replace 'your_app' with your actual package name

// Define states
abstract class TripsState {}

class TripsLoadingState extends TripsState {}

class TripsLoadedState extends TripsState {
  final List<Trip> trips;

  TripsLoadedState(this.trips);
}

class TripsErrorState extends TripsState {
  final String errorMessage;

  TripsErrorState(this.errorMessage);
}




