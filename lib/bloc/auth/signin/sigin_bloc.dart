import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/signin/signin_event.dart';
import 'package:xtrip_mobile/bloc/auth/signin/signin_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignInBloc({required this.authRepo, required this.authCubit})
      : super(SignInState()) {
    on<SignInEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));

    on<SignInPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );
    on<SignInSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final response =
          await authRepo.signin(email: state.email, password: state.password);
    });
  }
}
