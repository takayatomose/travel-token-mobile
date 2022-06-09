abstract class SignUpEvent {}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  SignUpEmailChanged({required this.email});
}

class SignUpInvitationChanged extends SignUpEvent {
  final String invitationCode;
  SignUpInvitationChanged({required this.invitationCode});
}

class SignUpFullNameChanged extends SignUpEvent {
  final String fullName;
  SignUpFullNameChanged({required this.fullName});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  SignUpPasswordChanged({required this.password});
}
