import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';

enum AuthState { signUp, login, forgotPassword, resetPassword, onBoard }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.onBoard);
  void showSignIn() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);
}
