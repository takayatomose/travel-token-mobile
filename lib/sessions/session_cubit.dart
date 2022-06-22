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
  final _secureStorage = const FlutterSecureStorage();
  final userRepository = UserRepository();
  SessionCubit({required this.authRepo}) : super(UnknownSessionState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    if (!(await Permission.locationAlways.request().isGranted)) {
      emit(UnAuthorizedPermissions());
    } else {
      try {
        await attemptAutoLogin();
        emit(Authenticated(user: null));
      } on Exception {
        emit(Unauthenticated());
      }
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

      final user = await userRepository.getUserInfo();

      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void setSession(AuthCredentials authCredentials) async {
    await _secureStorage.write(key: USER_TOKEN, value: authCredentials.token);
    // final user =
    final user = await userRepository.getUserInfo();
    emit(Authenticated(user: user));
    try {} on Exception catch (e) {
      emit(Unauthenticated());
    }
  }
}
