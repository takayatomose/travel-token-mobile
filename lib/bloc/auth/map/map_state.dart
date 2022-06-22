part of 'map_bloc.dart';

@immutable
class MapState {
  final int selectedIndex;

  const MapState(this.selectedIndex);

  MapState copyWith({
    int? selectedIndex,
  }) {
    print('selectedIndex: ${selectedIndex}');
    print('this.selectedIndex: ${this.selectedIndex}');
    final a =  MapState(selectedIndex ?? this.selectedIndex);
    print('a: ${a}');
    return a; 
  }
}
