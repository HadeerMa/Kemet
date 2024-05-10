abstract class SignInstate {}

final class SignInSuccess extends SignInstate {
  final String msg;
  SignInSuccess({required this.msg});
}

final class SignInInitial extends SignInstate {}

class SignInLoading extends SignInstate {}

class SignInError extends SignInstate {
  final String error;

  SignInError({required this.error});
}
