import 'dart:convert';

import 'package:xtrip_mobile/models/user.dart';
import 'package:xtrip_mobile/utils/api.dart';

class UserRepository {
  final apiService = ApiService();
  Future<UserModel?> getUserInfo() async {
    try {
      final response = await apiService.getApi(uri: '/user/info');
      if (response.statusCode != 200) {
        throw Exception('not found');
      }
      final user = UserModel.fromJson(json.decode(response.body));
      return user;
    } on Exception {
      return null;
    }
  }
}
