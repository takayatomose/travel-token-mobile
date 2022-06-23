import 'package:xtrip_mobile/bloc/auth/auth_credentials.dart';

enum AppAuthState { unknownSessionState, unauthenticated, authenticated }

class AppSessionState {
  final bool locationPermission;
  final dynamic user;
  final AppAuthState appAuthState;
  AppSessionState(
      {required this.locationPermission,
      this.user,
      this.appAuthState = AppAuthState.unknownSessionState});
  AppSessionState copyWith(
      {bool? locationPermission, AppAuthState? appAuthState, dynamic user}) {
    return AppSessionState(
        locationPermission: locationPermission ?? this.locationPermission,
        appAuthState: appAuthState ?? this.appAuthState,
        user: user ?? this.user);
  }
}
