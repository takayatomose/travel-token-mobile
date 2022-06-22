import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';

enum ScreenState {
  signUp,
  login,
  forgotPassword,
  resetPassword,
  onBoard,
  activation
}

class AuthState {
  final ScreenState screenState;
  final String email;
  AuthState({this.email = '', this.screenState = ScreenState.onBoard});
  AuthState copyWith({String? email, ScreenState? screenState}) {
    return AuthState(
        email: email ?? this.email,
        screenState: screenState ?? this.screenState);
  }
}

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState());
  void showSignIn() => emit(AuthState(screenState: ScreenState.login));
  void showSignUp() => emit(AuthState(screenState: ScreenState.signUp));
  void showActivation({required String email}) =>
      emit(AuthState(screenState: ScreenState.activation, email: email));
  void showForgotPassword() =>
      emit(AuthState(email: '', screenState: ScreenState.forgotPassword));
}
