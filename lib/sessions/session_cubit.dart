import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  SessionCubit({required this.authRepo}) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }
  void attemptAutoLogin () async {
    try {
      await authRepo.attemptAutoLogin();
      emit(Authenticated(user: null));
    } on Exception {
      emit(Unauthenticated());
    }
  }
}
