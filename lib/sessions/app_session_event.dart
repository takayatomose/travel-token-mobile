abstract class AppSessionEvent {}

class LocationServiceDenied extends AppSessionEvent {}

class AppAuthenticated extends AppSessionEvent {
  final dynamic user;
  AppAuthenticated({required this.user});
}

class AppUnAuthenticated extends AppSessionEvent {}
