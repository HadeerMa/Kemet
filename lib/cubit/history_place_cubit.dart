import 'package:bloc/bloc.dart';
import 'history_place_state.dart';


class HistoryOfPlaceCubit extends Cubit<HistoryOfPlaceState> {
  HistoryOfPlaceCubit() : super(HistoryOfPlaceInitial());

  void loadHistory() {
    emit(HistoryOfPlaceLoading());
    // Add your logic to fetch history data from the repository
    // Example: repository.fetchHistory().then((history) => emit(HistoryOfPlaceLoaded(history)));
    // Handle errors if any
  }
}


