import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:xtrip_mobile/models/paginate_document.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:xtrip_mobile/utils/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'shop_event.dart';
part 'shop_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final http.Client httpClient;
  final apiService = ApiService();

  ShopBloc({required this.httpClient}) : super(ShopState()) {
    on<FetchCategories>((event, emit) async {
      try {
        final categories = await _fetchCategories();
        return emit(state.copyWith(
          categories: categories,
        ));
      } catch (e) {}
    });
    on<SelectCategory>((event, emit) async {
      final items = await _fetchItems(
          1, state.categories[event.selectedCategoryIndex].id);
      return emit(state.copyWith(
        fetchItemStatus: FetchStatus.success,
        selectedCategoryIndex: event.selectedCategoryIndex,
        items: items,
        hasReachedMax: items.length < 5,
      ));
    });

    on<FetchItems>(
      (event, emit) async {
        try {
          if (state.fetchItemStatus == FetchStatus.initial) {
            final items = await _fetchItems(1);
            return emit(state.copyWith(
              fetchItemStatus: FetchStatus.success,
              items: items,
              hasReachedMax: items.length < 5,
            ));
          }

          final items;
          if (state.selectedCategoryIndex == -1) {
            items = await _fetchItems((state.items.length / 5).floor() + 1, -1);
          } else {
            items = await _fetchItems((state.items.length / 5).floor() + 1,
                state.categories[state.selectedCategoryIndex].id);
          }

          items.isEmpty
              ? emit(state.copyWith(hasReachedMax: true))
              : emit(
                  state.copyWith(
                    fetchItemStatus: FetchStatus.success,
                    items: List.of(state.items)..addAll(items),
                    hasReachedMax: false,
                  ),
                );
        } catch (_) {
          emit(state.copyWith(fetchItemStatus: FetchStatus.failure));
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<List<Category>> _fetchCategories() async {
    final response = await apiService.getAPI(uri: '/item-category');
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return body.map((dynamic json) {
        return Category(
          name: json['name'] as String,
          id: json['id'] as int,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }

  Future<List<Item>> _fetchItems([int page = 1, itemCategeryId = -1]) async {
    var uri = '/item?page=${page}';
    if (itemCategeryId != -1) {
      uri = '/item?page=${page}&item_category_id=${itemCategeryId}';
    }
    final response = await apiService.getAPI(uri: uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map["items"].map<Item>((model) => Item.fromJson(model)).toList();
    }
    throw Exception('error fetching posts');
  }
}
