import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';

enum AuthState { signUp, login, forgotPassword, resetPassword }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.login);
}
