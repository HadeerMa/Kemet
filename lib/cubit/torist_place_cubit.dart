import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/torist_place_state.dart';
//import 'package:your_app/services/tourist_place_service.dart'; // Import your service to fetch data

// Define cubit
class TouristPlacesCubit extends Cubit<TouristPlacesState> {
  TouristPlacesCubit(super.initialState);

 // final TouristPlaceService service; // Your service to fetch data

 // TouristPlacesCubit(this.service) : super(TouristPlacesLoading());

  Future<void> fetchPlaces() async {
    try {
    //  List<TouristPlace> places = await service.fetchTouristPlaces();
    //  emit(TouristPlacesLoaded(places));
    } catch (e) {
      emit(TouristPlacesError('Failed to fetch places: $e'));
    }
  }
}
