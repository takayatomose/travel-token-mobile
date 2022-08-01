import 'dart:convert';

import 'package:xtrip_mobile/models/user_item.dart';
import 'package:xtrip_mobile/utils/api.dart';

class ItemRepository {
  final apiService = ApiService();

  Future<UserItem> getItem({required int itemId}) async {
    final response = await apiService.getAPI(uri: "/user-items/$itemId");
    if (response.statusCode == 200) {
      return UserItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('item not found');
    }
  }
}
