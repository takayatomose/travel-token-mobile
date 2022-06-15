import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_event.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class ForgotPwdBloc extends Bloc<ForgotPwdEvent, ForgotPwdState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ForgotPwdBloc({required this.authCubit, required this.authRepo})
      : super(ForgotPwdState(formState: PwdFormState.forgot)) {
    on<ForgotPwdFormStateChanged>((event, emit) => emit(state.copyWith(
        formState: event.formState, formStatus: const InitialFormStatus())));
    on<ForgotPwdEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));
    on<ForgotPwdCodeChanged>(
        (event, emit) => emit(state.copyWith(code: event.code)));
    on<ForgotPwdPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<ForgotPwdAgain>(((event, emit) =>
        emit(state.copyWith(formStatus: const InitialFormStatus()))));
    on<ForgotPwdSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        final response = await authRepo.forgotPassword(email: state.email);
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {
          throw Exception('Invalid');
        }
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
    on<ResetPwdSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        final response = await authRepo.resetPassword(
            email: state.email, password: state.password, code: state.code);
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {
          throw Exception('Invalid');
        }
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
  }
}
