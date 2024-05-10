import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/legend_state.dart';

class LegendCubit extends Cubit<LegendState> {
  LegendCubit() : super(LegendInitialState());

  void fetchData() async {
    emit(LegendLoadingState());

    try {
      // Perform data fetching logic here
      // For example, fetching data from an API
      await Future.delayed(Duration(seconds: 2)); // Simulate delay
      // Emit success state with data
      emit(LegendInitialState());
    } catch (e) {
      // Emit error state if fetching data fails
      emit(LegendErrorState('Failed to fetch data'));
    }
  }
}
