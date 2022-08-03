part of './sigin_bloc.dart';

abstract class SignInEvent {}

class SignInEmailChanged extends SignInEvent {
  final String email;
  SignInEmailChanged({required this.email});
}

class SignInPasswordChanged extends SignInEvent {
  final String password;
  SignInPasswordChanged({required this.password});
}

class SignInSubmitted extends SignInEvent {}

class SignInAgain extends SignInEvent {}
