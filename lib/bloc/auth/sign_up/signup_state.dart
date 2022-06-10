import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class SignUpState {
  final String invitationCode;
  final String fullName;
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  SignUpState({
    this.invitationCode = '',
    this.email = '',
    this.fullName = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignUpState copyWith(
      {String? invitationCode,
      String? email,
      String? fullName,
      String? password,
      FormSubmissionStatus? formStatus}) {
    return SignUpState(
        invitationCode: invitationCode ?? this.invitationCode,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
