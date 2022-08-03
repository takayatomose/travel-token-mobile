part of './sigin_bloc.dart';

class SignInState {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  SignInState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  SignInState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
