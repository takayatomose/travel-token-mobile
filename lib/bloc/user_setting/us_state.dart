import 'package:xtrip_mobile/models/wallet.dart';

abstract class USState {}

class USSettingState extends USState {
  final List<Wallet> wallets;
  USSettingState({this.wallets = const []});
}

class USInfoState extends USState {}

class USPasswordState extends USState {}

class USContactState extends USState {}

class USInviteState extends USState {
  final String invitationCode;
  USInviteState({this.invitationCode = ''});
}

class USGuideState extends USState {}

class USTosState extends USState {}
