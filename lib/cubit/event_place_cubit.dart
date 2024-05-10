// review_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'event_place_state.dart';

// Define the Cubit
class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewsLoading());

  void loadReviews() {
    // Implement the logic to load reviews
    // Emit appropriate states based on success or failure
  }

  void updateReview(String text, double rating) {
    // Implement the logic to update the review
    // Emit appropriate states based on success or failure
  }

  void deleteReview() {
    // Implement the logic to delete the review
    // Emit appropriate states based on success or failure
  }
}
