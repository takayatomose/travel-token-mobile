import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/app_session_event.dart';
import 'package:xtrip_mobile/sessions/app_session_state.dart';

import '../constants/user_constants.dart';

class AppSessionBloc extends Bloc<AppSessionEvent, AppSessionState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final _secureStorage = const FlutterSecureStorage();

  AppSessionBloc({required this.authRepository, required this.userRepository})
      : super(AppSessionState(locationPermission: true)) {
    loadData();
  }

  Future<void> loadData() async {
    if (!await Permission.locationAlways.request().isGranted) {
      add(LocationServiceDenied());
    }
    try {
      final userToken = await _secureStorage.read(key: USER_TOKEN);
      if (userToken == null || userToken == '' || userToken.isEmpty) {
        throw Exception('Not logged in');
      }
      if (JwtDecoder.isExpired(userToken) == true) {
        // TODO: refresh token
      }

      final user = await userRepository.getUserInfo();
      if (user == null) {
        await _secureStorage.delete(key: USER_TOKEN);
        throw Exception('Not found user');
      }
    } on Exception catch (e) {
      add(AppUnAuthenticated());
    }
  }
}
