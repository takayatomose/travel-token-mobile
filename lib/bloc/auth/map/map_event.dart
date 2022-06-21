part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class SelectSpot extends MapEvent {
  final int selectedIndex;
  SelectSpot({required this.selectedIndex});
}


