import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'shop_event.dart';
part 'shop_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final http.Client httpClient;

  ShopBloc({required this.httpClient}) : super(ShopState()) {
    on<FetchCategories>((event, emit) async {
      try {
        final categories = await _fetchCategories();
        return emit(state.copyWith(
          categories: categories,
        ));
      } catch (e) {}
    });
    on<SelectCategory>((event, emit) {
      return emit(state.copyWith(
        selectedCategoryIndex: event.selectedCategoryIndex,
      ));
    });

    on<FetchItems>(
      (event, emit) async {
        try {
          if (state.fetchItemStatus == FetchStatus.initial) {
            final items = await _fetchItems();
            return emit(state.copyWith(
              fetchItemStatus: FetchStatus.success,
              items: items,
              hasReachedMax: false,
            ));
          }
          print("FetchItems " +
              state.fetchItemStatus.toString() +
              state.items.length.toString());

          final items = await _fetchItems(state.items.length);

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
          print("Error: " + _.toString());
          emit(state.copyWith(fetchItemStatus: FetchStatus.failure));
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<List<Category>> _fetchCategories([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.http(
        dotenv.get('API_URL'),
        '/item-category',
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      print(
        "body",
      );
      return body.map((dynamic json) {
        return Category(
          name: json['name'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }

  Future<List<Item>> _fetchItems([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.http(
        dotenv.get('API_URL'),
        '/item',
      ),
    );
    if (response.statusCode == 200) {
      // final body = json.decode(response.body);
      // final items = body.items as List<Item>;
      // return body.map((dynamic json) {
      //   return Item(id: json['id'] as int, name: json['title'] as String);
      // }).toList();

      Iterable itemList = json.decode(response.body).items;
      List<Item> items =
          List<Item>.from(itemList.map((model) => Item.fromJson(model)));
          return items;
    }
    throw Exception('error fetching posts');
  }
}
