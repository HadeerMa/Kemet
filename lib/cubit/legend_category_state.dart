

// Define states
abstract class LegendCategoryState {}

class LegendCategoryInitialState extends LegendCategoryState {}

class LegendCategoryLoadingState extends LegendCategoryState {}

class LegendCategoryErrorState extends LegendCategoryState {
  final String errorMessage;

  LegendCategoryErrorState(this.errorMessage);
}

class LegendCategoryLoadedState extends LegendCategoryState {}

