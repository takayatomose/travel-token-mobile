import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState()) {
    on<SelectSpot>((event, emit) {
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    });
  }
}
