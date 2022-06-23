import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_event.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class UserActivationBloc
    extends Bloc<UserActivationEvent, UserActivationState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  UserActivationBloc({required this.authRepo, required this.authCubit})
      : super(UserActivationState(email: authCubit.state.email)) {
    on<UserActivationEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));
    on<UserActivationCodeChange>((event, emit) =>
        emit(state.copyWith(activationCode: event.activationCode)));
    on<ActiveCodeAgain>(((event, emit) => emit(
        state.copyWith(formStatus: const InitialFormStatus(), activationCode: ''))));
    on<UserActivationSubmitted>(
      (event, emit) async {
        emit(state.copyWith(formStatus: FormSubmitting()));
        try {
          final response = await authRepo.activateUser(
              email: state.email, code: state.activationCode);
          if (response.statusCode == 200) {
            emit(state.copyWith(formStatus: SubmissionSuccess()));
          } else {
            emit(state.copyWith(
                formStatus: SubmissionFailed(Exception('Invalid'))));
          }
        } on Exception catch (e) {
          emit(state.copyWith(formStatus: SubmissionFailed(e)));
        }
        // });
      },
    );
  }
}
