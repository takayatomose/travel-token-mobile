part of 'map_bloc.dart';

@immutable
class MapState {
  final int selectedIndex;

  const MapState(this.selectedIndex);

  MapState copyWith({
    int? selectedIndex,
  }) {
    final a = MapState(selectedIndex ?? this.selectedIndex);

    return a;
  }
}
