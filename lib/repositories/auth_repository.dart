import 'package:http/http.dart' as http;
import 'package:xtrip_mobile/utils/api.dart';
import 'dart:convert';

class AuthRepository {
  Future<void> signup(
      {required String invitationCode,
      required String email,
      required String fullName,
      required String password}) async {
    final response = await http.post(Uri.parse('${Api.getHttpClient()}/user'),
        body: json.encode({
          'invitationCode': invitationCode,
          'email': email,
          'fullName': fullName,
          'password': password
        }));
  }
}
