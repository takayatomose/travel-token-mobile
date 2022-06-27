abstract class UserInfoEvent {}

class UserInfoFullNameChanged extends UserInfoEvent {
  final String fullName;
  UserInfoFullNameChanged({required this.fullName});
}

class UserInfoSubmitted extends UserInfoEvent {}
