import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_state.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';

class USCubit extends Cubit<USState> {
  USCubit() : super(USSettingState());
  void accountInfo() {
    emit(USInfoState());
  }

  void changePassword() {
    emit(USPasswordState());
  }

  void userSetting() {
    emit(USSettingState());
  }

  void tos() {
    emit(USTosState());
  }

  void contactUs() {
    emit(USContactState());
  }

  void guide() {
    emit(USGuideState());
  }

  void inviteFriend() {
    emit(USInviteState());
  }

  void fetchInvitationCode() async {
    UserRepository userRepository = UserRepository();
    try {
      final response = await userRepository.getInvitationCode();
      Map<String, dynamic> inviteCode = jsonDecode(response.body);
      emit(USInviteState(invitationCode: inviteCode['code']));
    } on Exception catch (e) {}
  }
}
