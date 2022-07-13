import 'package:xtrip_mobile/models/user_play_attributes.dart';

abstract class AuthSessionState {}

class UnknownSessionState extends AuthSessionState {}

class Unauthenticated extends AuthSessionState {}

class Authenticated extends AuthSessionState {}

class SessionState {
  final bool locationPermission;
  final dynamic user;
  final AuthSessionState authSessionState;
  final UserPlayAttributes userPlayAttributes;
  SessionState(
      {required this.locationPermission,
      this.user,
      required this.authSessionState,
      this.userPlayAttributes = const UserPlayAttributes()});
  SessionState copyWith(
      {bool? locationPermission,
      dynamic user,
      AuthSessionState? authSessionState,
      UserPlayAttributes? userPlayAttributes}) {
    return SessionState(
        authSessionState: authSessionState ?? this.authSessionState,
        locationPermission: locationPermission ?? this.locationPermission,
        user: user ?? this.user,
        userPlayAttributes: userPlayAttributes ?? this.userPlayAttributes);
  }
}
