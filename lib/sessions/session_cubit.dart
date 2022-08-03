import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xtrip_mobile/bloc/auth/auth_credentials.dart';
import 'package:xtrip_mobile/constants/user_constants.dart';
import 'package:xtrip_mobile/constants/wallet_constants.dart';
import 'package:xtrip_mobile/models/user_play_attributes.dart';
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
        final refreshToken = await _secureStorage.read(key: USER_REFRESH_TOKEN);
        if (refreshToken != null &&
            refreshToken != '' &&
            refreshToken.isNotEmpty) {
          final response = await authRepo.refreshToken(
              userToken: userToken, refreshToken: refreshToken);
          final Map<String, String> body = json.decode(response.body);
          if (body['token'] != null && body['json'] != '') {
            await _secureStorage.write(key: USER_TOKEN, value: body['json']);
          }
        }
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

  Future<void> fetchUserInfo() async {
    try {
      final user = await userRepo.getUserInfo();
      emit(state.copyWith(user: user));
    } on Exception catch (e) {}
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

  Future<void> fetchUserAttributes() async {
    try {
      final userAttributes = await userRepo.fetchUserPlayAttribute();
      emit(state.copyWith(userPlayAttributes: userAttributes));
    } on Exception catch (e) {
      emit(state.copyWith(userPlayAttributes: const UserPlayAttributes()));
    }
  }

  void signOut() async {
    await _secureStorage.delete(key: USER_TOKEN);
    await _secureStorage.delete(key: USER_REFRESH_TOKEN);
    await _secureStorage.delete(key: E_WALLET_PRIVATE_KEY);
    await _secureStorage.delete(key: E_WALLET_PUBLIC_KEY);
    emit(state.copyWith(authSessionState: Unauthenticated()));
  }
}
