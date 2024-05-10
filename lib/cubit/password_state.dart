import 'package:password_strength_checker/password_strength_checker.dart';

abstract class PasswordState {}

class PasswordInitial extends PasswordState {}

class PasswordStrengthChanged extends PasswordState {
  final PasswordStrength? strength;

  PasswordStrengthChanged(this.strength);
}