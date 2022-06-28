import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/change_password/change_password_event.dart';
import 'package:xtrip_mobile/bloc/user_setting/change_password/change_password_state.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final SessionCubit sessionCubit;
  final UserRepository userRepo;

  ChangePasswordBloc({required this.sessionCubit, required this.userRepo})
      : super(ChangePasswordState()) {
    on<ChangePasswordCurrentChanged>((event, emit) =>
        emit(state.copyWith(currentPassword: event.currentPassword)));
    on<ChangePasswordNewChanged>(
      (event, emit) => emit(state.copyWith(newPassword: event.newPassword)),
    );
    on<ChangePasswordSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        final response = await userRepo.changePassowrd(
            currentPassword: state.currentPassword,
            newPassword: state.newPassword);
        if (response.statusCode == 200) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {}
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
  }
}
