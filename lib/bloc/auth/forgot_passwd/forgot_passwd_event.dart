import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_state.dart';

abstract class ForgotPwdEvent {}

class ForgotPwdFormStateChanged extends ForgotPwdEvent {
  final PwdFormState formState;
  ForgotPwdFormStateChanged({required this.formState});
}

class ForgotPwdEmailChanged extends ForgotPwdEvent {
  final String email;
  ForgotPwdEmailChanged({required this.email});
}

class ForgotPwdCodeChanged extends ForgotPwdEvent {
  final String code;
  ForgotPwdCodeChanged({required this.code});
}

class ForgotPwdPasswordChanged extends ForgotPwdEvent {
  final String password;
  ForgotPwdPasswordChanged({required this.password});
}

class ForgotPwdAgain extends ForgotPwdEvent {}

class ForgotPwdSubmitted extends ForgotPwdEvent {}

class ResetPwdSubmitted extends ForgotPwdEvent {}
