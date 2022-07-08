import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_event.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_state.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final SessionCubit sessionCubit;
  final UserRepository userRepo;
  UserInfoBloc(
      {required String fullName,
      required this.sessionCubit,
      required this.userRepo})
      : super(UserInfoState(fullName: fullName)) {
    on<UserInfoEditableChanged>((event, emit) => emit(state.copyWith(
        editing: event.editabled, formStatus: const InitialFormStatus())));
    on<UserInfoFullNameChanged>(
        (event, emit) => emit(state.copyWith(fullName: event.fullName)));
    on<UserInfoSubmitted>((event, emit) async {
      try {
        final response = await userRepo.updateInfo(fullName: state.fullName);
        if (response.statusCode == 200) {
          await sessionCubit.fetchUserInfo();
          emit(state.copyWith(editing: false, formStatus: SubmissionSuccess()));
        } else {}
      } on Exception catch (e) {}
    });
    on<FetchInvitationCode>((event, emit) async {
      try {
        final response = await userRepo.getInvitationCode();
        Map<String, String> inviteCode = jsonDecode(response.body);
        emit(state.copyWith(invitationCode: inviteCode['code']));
      } on Exception catch (e) {}
    });
  }
}
