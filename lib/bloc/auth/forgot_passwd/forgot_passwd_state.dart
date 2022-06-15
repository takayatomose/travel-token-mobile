import 'package:xtrip_mobile/sessions/form_submission_status.dart';

enum PwdFormState { forgot, reset }

class ForgotPwdState {
  final PwdFormState formState;
  final String email;
  final String code;
  final String password;
  final FormSubmissionStatus formStatus;
  ForgotPwdState({
    this.formState = PwdFormState.forgot,
    this.email = '',
    this.code = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  ForgotPwdState copyWith(
      {PwdFormState? formState,
      String? email,
      String? code,
      String? password,
      FormSubmissionStatus? formStatus}) {
    return ForgotPwdState(
      formState: formState ?? this.formState,
      email: email ?? this.email,
      code: code ?? this.code,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
