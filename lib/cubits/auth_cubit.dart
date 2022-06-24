import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/auth_credentials.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';

enum ScreenState {
  signUp,
  login,
  forgotPassword,
  resetPassword,
  onBoard,
  activation,
  customMap,
  home
}

class AuthState {
  final ScreenState screenState;
  final String email;
  final List<ScreenState> screenStack;

  AuthState(
      {this.email = '',
      this.screenState = ScreenState.onBoard,
      this.screenStack = const [ScreenState.onBoard]});
  // AuthState copyWith({String? email, ScreenState? screenState}) {
  //   return AuthState(
  //       email: email ?? this.email,
  //       screenState: screenState ?? this.screenState,
  //       );
  // }
}

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  AuthCubit({required this.sessionCubit}) : super(AuthState());

  List<ScreenState> addScreenToStack(ScreenState newScreen) {
    var screenStack = List<ScreenState>.from(state.screenStack);
    screenStack.add(newScreen);
    var reversedList = List<ScreenState>.from(screenStack.reversed);
    screenStack = reversedList.toSet().toList();
    return List<ScreenState>.from(screenStack.reversed);
  }

  void showSignIn() {
    var screenStack = addScreenToStack(ScreenState.login);
    emit(AuthState(screenState: ScreenState.login, screenStack: screenStack));
  }

  void showSignUp() {
    var screenStack = addScreenToStack(ScreenState.signUp);
    emit(AuthState(screenState: ScreenState.signUp, screenStack: screenStack));
  }

  void showActivation({required String email}) {
    var screenStack = addScreenToStack(ScreenState.activation);
    print('activation screenStack: ${screenStack}');
    emit(AuthState(
        screenState: ScreenState.activation,
        email: email,
        screenStack: screenStack));
  }

  void showForgotPassword() {
    var screenStack = addScreenToStack(ScreenState.forgotPassword);
    emit(AuthState(
        email: '',
        screenState: ScreenState.forgotPassword,
        screenStack: screenStack));
  }

  void launchSession(AuthCredentials authCredentials) {
    sessionCubit.setSession(authCredentials);
  }

  void showMap() => emit(AuthState(screenState: ScreenState.customMap));
  void showHome() => emit(AuthState(screenState: ScreenState.home));
}
