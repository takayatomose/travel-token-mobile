import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/models/user_item.dart';
import 'package:xtrip_mobile/utils/api.dart';

part 'my_item_event.dart';
part 'my_item_state.dart';

class MyItemBloc extends Bloc<MyItemEvent, MyItemState> {
  final apiService = ApiService();
  MyItemBloc() : super(MyItemState()) {
    on<FetchItems>((event, emit) async {
      final items = await fetchUserItems();
      emit(state.copyWith(items: items));
    });
  }

  Future<List<UserItem>> fetchUserItems() async {
    final response = await apiService.getAPI(uri: '/user-items');
    if (response.statusCode != 200) {
      throw Exception('error fetching items');
    }
    final Iterable body = json.decode(response.body);
    return body.map((e) => UserItem.fromJson(e)).toList();
  }
}
