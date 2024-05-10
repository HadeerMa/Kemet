import 'package:flutter_bloc/flutter_bloc.dart';
import 'offers_state.dart';
//import 'package:your_app/services/api_service.dart'; // Import your ApiService
// Define Cubit
class OfferScreenCubit extends Cubit<OfferScreenState> {
  OfferScreenCubit(super.initialState);

  //final ApiService apiService;

  //OfferScreenCubit(this.apiService) : super(OfferScreenLoadingState());

  // Method to fetch tourist places data from API
  Future<void> fetchTouristPlacesData() async {
    try {
      // Fetch data from the API
    // List<TouristPlace> places = await apiService.fetchTouristPlaces();

      // Emit the loaded state with the places data
     // emit(OfferScreenLoadedState(places));
    } catch (e) {
      // Emit the error state if there's an error
      emit(OfferScreenErrorState('Failed to load tourist places: $e'));
    }
  }
}

