import 'dart:convert';

import 'package:xtrip_mobile/models/user.dart';
import 'package:xtrip_mobile/utils/api.dart';

class UserRepository {
  final apiService = ApiService();
  Future<UserModel?> getUserInfo() async {
    try {
      final response = await apiService.getApi(uri: '/user/info');
      print(json.decode(response.body));
      return UserModel.fromJson(json.decode(response.body));
    } on Exception catch (e) {
      return null;
    }
  }
}
