
// Define the states for the Legend screen
abstract class LegendState {}

class LegendInitialState extends LegendState {}

class LegendLoadingState extends LegendState {}

class LegendErrorState extends LegendState {
  final String errorMessage;

  LegendErrorState(this.errorMessage);
}

// Define the events for the Legend screen
//abstract class LegendEvent {}

//class FetchLegendDataEvent extends LegendEvent {}


