import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xtrip_mobile/bloc/auth/auth_credentials.dart';
import 'package:xtrip_mobile/constants/user_constants.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  final UserRepository userRepo;
  final _secureStorage = const FlutterSecureStorage();

  SessionCubit({required this.authRepo, required this.userRepo})
      : super(SessionState(
            locationPermission: true,
            authSessionState: UnknownSessionState())) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    if (!(await Permission.locationAlways.request().isGranted)) {
      emit(state.copyWith(locationPermission: false));
    }
    try {
      await attemptAutoLogin();
    } on Exception {
      emit(state.copyWith(authSessionState: Authenticated()));
    }
  }

  Future<void> attemptAutoLogin() async {
    try {
      final userToken = await _secureStorage.read(key: USER_TOKEN);
      if (userToken == null || userToken == '' || userToken.isEmpty) {
        throw Exception('Not logged in');
      }
      if (JwtDecoder.isExpired(userToken) == true) {
        // TODO: refresh token
      }

      final user = await userRepo.getUserInfo();
      if (user == null) {
        await _secureStorage.delete(key: USER_TOKEN);
        throw Exception('Not found user');
      }
      emit(state.copyWith(authSessionState: Authenticated(), user: user));
    } on Exception catch (e) {
      emit(state.copyWith(authSessionState: Unauthenticated()));
    }
  }

  void setSession(AuthCredentials authCredentials) async {
    try {
      await _secureStorage.write(key: USER_TOKEN, value: authCredentials.token);
      final user = await userRepo.getUserInfo();
      emit(state.copyWith(authSessionState: Authenticated(), user: user));
    } on Exception catch (e) {
      emit(state.copyWith(authSessionState: Unauthenticated()));
    }
  }

  void signOut() async {
    await _secureStorage.delete(key: USER_TOKEN);
    await _secureStorage.delete(key: USER_REFRESH_TOKEN);
    emit(state.copyWith(authSessionState: Unauthenticated()));
  }
}
