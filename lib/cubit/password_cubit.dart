import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/password_state.dart';
import 'package:password_strength_checker/password_strength_checker.dart';


class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  void updatePasswordStrength(PasswordStrength? strength) {
    emit(PasswordStrengthChanged(strength));
  }
}