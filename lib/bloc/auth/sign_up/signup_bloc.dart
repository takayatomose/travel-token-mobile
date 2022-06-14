import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_event.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignUpBloc({required this.authRepo, required this.authCubit})
      : super(SignUpState()) {
    on<SignUpInvitationChanged>((event, emit) =>
        emit(state.copyWith(invitationCode: event.invitationCode)));
    on<SignUpFullNameChanged>(
        (event, emit) => emit(state.copyWith(fullName: event.fullName)));
    on<SignUpPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<SignUpEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));
    on<SignUpAgain>(
      (event, emit) => emit(state.copyWith(formStatus: InitialFormStatus())),
    );
    on<SignUpSubmitted>(((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        final response = await authRepo.signup(
            invitationCode: state.invitationCode,
            email: state.email,
            fullName: state.fullName,
            password: state.password);
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {
          emit(state.copyWith(
              formStatus: SubmissionFailed(Exception('Bad request'))));
        }
      } on Exception {
        print('grhhhh');
        emit(
            state.copyWith(formStatus: SubmissionFailed(Exception('Invalid'))));
      }
    }));
  }
}
