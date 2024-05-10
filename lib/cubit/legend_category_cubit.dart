import 'package:flutter_bloc/flutter_bloc.dart';

import 'legend_category_state.dart';
// Define Cubit
class LegendCategoryCubit extends Cubit<LegendCategoryState> {
  LegendCategoryCubit() : super(LegendCategoryInitialState());

  // You can add methods here to handle different actions or events

  // Example method to simulate data loading
  Future<void> loadData() async {
    emit(LegendCategoryLoadingState());

    try {
      // Add your logic to load data here (e.g., API calls)
      await Future.delayed(Duration(seconds: 2));

      // If successful, emit the loaded state
      emit(LegendCategoryLoadedState());
    } catch (e) {
      // If there's an error, emit the error state
      emit(LegendCategoryErrorState('Failed to load data: $e'));
    }
  }
}
