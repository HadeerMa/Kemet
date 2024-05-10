// review_state.dart
abstract class ReviewState {}

class ReviewsLoading extends ReviewState {}

class ReviewsLoaded extends ReviewState {
  final List<Map<String, dynamic>> reviews;

  ReviewsLoaded(this.reviews);
}

class ReviewsError extends ReviewState {}

// Define the events
abstract class ReviewEvent {}

class LoadReviews extends ReviewEvent {}

class UpdateReview extends ReviewEvent {
  final String text;
  final double rating;

  UpdateReview(this.text, this.rating);
}

class DeleteReview extends ReviewEvent {}

