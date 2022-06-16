import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  SessionCubit({required this.authRepo}) : super(UnknownSessionState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    if (!(await Permission.locationAlways.request().isGranted)) {
      emit(UnAuthorizedPermissions());
    } else {
      try {
        await authRepo.attemptAutoLogin();
        emit(Authenticated(user: null));
      } on Exception {
        emit(Unauthenticated());
      }
    }
  }

  void attemptAutoLogin() async {
    try {
      await authRepo.attemptAutoLogin();
      emit(Authenticated(user: null));
    } on Exception {
      emit(Unauthenticated());
    }
  }
}
