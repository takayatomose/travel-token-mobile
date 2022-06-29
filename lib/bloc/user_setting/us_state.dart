abstract class USState {}

class USSettingState extends USState {}

class USInfoState extends USState {}

class USPasswordState extends USState {}

class USContactState extends USState {}

class USInviteState extends USState {
  final String invitationCode;
  USInviteState({this.invitationCode = ''});
}

class USGuideState extends USState {}

class USTosState extends USState {}
