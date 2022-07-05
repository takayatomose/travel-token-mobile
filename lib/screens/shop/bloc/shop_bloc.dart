import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
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
  }
  final http.Client httpClient;

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
}
