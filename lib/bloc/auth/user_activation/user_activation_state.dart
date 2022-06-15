import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class UserActivationState {
  final String activationCode;
  final FormSubmissionStatus formStatus;
  final String email;
  UserActivationState(
      {this.email = '',
      this.activationCode = '',
      this.formStatus = const InitialFormStatus()});

  UserActivationState copyWith({
    String? email,
    String? activationCode,
    FormSubmissionStatus? formStatus,
  }) {
    return UserActivationState(
        email: email ?? this.email,
        activationCode: activationCode ?? this.activationCode,
        formStatus: formStatus ?? this.formStatus);
  }
}
