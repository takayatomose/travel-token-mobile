part of 'map_bloc.dart';

@immutable
class MapState {
  final int selectedIndex;

  MapState({this.selectedIndex = 0});

  MapState copyWith({
    int? selectedIndex,
  }) {
    return MapState(
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

