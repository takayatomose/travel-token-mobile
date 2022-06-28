abstract class UserInfoEvent {}

class UserInfoFullNameChanged extends UserInfoEvent {
  final String fullName;
  UserInfoFullNameChanged({required this.fullName});
}

class UserInfoEditableChanged extends UserInfoEvent {
  final bool editabled;
  UserInfoEditableChanged({required this.editabled});
}

class UserInfoSubmitted extends UserInfoEvent {}
