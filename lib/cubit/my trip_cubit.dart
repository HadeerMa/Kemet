import 'package:flutter_bloc/flutter_bloc.dart';

import 'my trip_state.dart';

// Define Cubit
class MyTripCubit extends Cubit<MyTripState> {
  MyTripCubit() : super(MyTripInitialState());

  // Method to simulate booking process
  void bookTicket() {
    // Simulate booking process
    // For example, you can make API calls here
    // For simplicity, we'll directly emit the success state
    emit(MyTripBookingSuccessState());
  }
}