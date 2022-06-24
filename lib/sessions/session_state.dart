abstract class AuthSessionState {}

class UnknownSessionState extends AuthSessionState {}

class Unauthenticated extends AuthSessionState {}

class Authenticated extends AuthSessionState {}

// enum AuthSessionState {
//   unknownSessionState,
//   unauthenticated,
//   authenticated,
// }

class SessionState {
  final bool locationPermission;
  final dynamic user;
  final AuthSessionState authSessionState;
  SessionState(
      {required this.locationPermission,
      this.user,
      required this.authSessionState});
  SessionState copyWith(
      {bool? locationPermission,
      dynamic user,
      AuthSessionState? authSessionState}) {
    return SessionState(
        authSessionState: authSessionState ?? this.authSessionState,
        locationPermission: locationPermission ?? this.locationPermission,
        user: user ?? this.user);
  }
}
