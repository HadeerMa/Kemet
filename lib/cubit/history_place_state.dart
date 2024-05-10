
// Define the states for the cubit
abstract class HistoryOfPlaceState {}

class HistoryOfPlaceInitial extends HistoryOfPlaceState {}

class HistoryOfPlaceLoading extends HistoryOfPlaceState {}

class HistoryOfPlaceError extends HistoryOfPlaceState {
  final String message;

  HistoryOfPlaceError(this.message);
}

// Define the events for the cubit
//abstract class HistoryOfPlaceEvent {}

//class LoadHistoryOfPlace extends HistoryOfPlaceEvent {}


