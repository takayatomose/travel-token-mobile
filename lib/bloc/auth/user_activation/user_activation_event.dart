abstract class UserActivationEvent {}

class UserActivationEmailChanged extends UserActivationEvent {
  final String email;
  UserActivationEmailChanged({required this.email});
}

class UserActivationCodeChange extends UserActivationEvent {
  final String activationCode;
  UserActivationCodeChange({required this.activationCode});
}

class UserActivationSubmitted extends UserActivationEvent {}
