import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/trips_state.dart';
// Define Cubit
class TripsCubit extends Cubit<TripsState> {
  TripsCubit() : super(TripsLoadingState());

  // Method to fetch trips data from API
  Future<void> fetchTripsData() async {
    try {
      // Simulate fetching data from an API
      // Replace this with your actual API call
     // List<Trip> trips = await yourApiService.fetchTrips();

      // Emit the loaded state with the trips data
      //emit(TripsLoadedState(trips));
    } catch (e) {
      // Emit the error state if there's an error
      emit(TripsErrorState('Failed to load trips: $e'));
    }
  }
}