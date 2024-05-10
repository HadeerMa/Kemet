
import '../screens/torist_place.dart';

// Define states
abstract class OfferScreenState {}

class OfferScreenLoadingState extends OfferScreenState {}

class OfferScreenLoadedState extends OfferScreenState {
  final List<TouristPlace> places;

  OfferScreenLoadedState(this.places);
}

class OfferScreenErrorState extends OfferScreenState {
  final String errorMessage;

  OfferScreenErrorState(this.errorMessage);
}

