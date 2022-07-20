import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState(0)) {
    on<SelectSpot>((event, emit) {
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    });
  }

  @override
  void onChange(Change<MapState> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
