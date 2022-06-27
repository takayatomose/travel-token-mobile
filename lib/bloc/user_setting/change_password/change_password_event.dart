abstract class ChangePasswordEvent {}

class ChangePasswordCurrentChanged extends ChangePasswordEvent {
  final String currentPassword;
  ChangePasswordCurrentChanged({required this.currentPassword});
}

class ChangePasswordNewChanged extends ChangePasswordEvent {
  final String newPassword;
  ChangePasswordNewChanged({required this.newPassword});
}

class ChangePasswordSubmitted extends ChangePasswordEvent {}
