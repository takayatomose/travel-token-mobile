import 'package:http/http.dart' as http;
import 'package:xtrip_mobile/utils/api.dart';
import 'dart:convert';

class AuthRepository {
  Future<http.Response> signup(
      {required String invitationCode,
      required String email,
      required String fullName,
      required String password}) async {
    final response = await http.post(Uri.parse('${Api.getHttpClient()}/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({
          'invitationCode': invitationCode,
          'email': email,
          'fullName': fullName,
          'password': password
        }));
    return response;
  }

  Future<http.Response> signin(
      {required String email, required String password}) {
    return http.post(Uri.parse('${Api.getHttpClient()}/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({'email': email, 'password': password}));
  }

  Future<http.Response> forgotPassword({required String email}) {
    return http.post(Uri.parse('${Api.getHttpClient()}/user/forgot-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({'email': email}));
  }

  Future attemptAutoLogin() async {
    throw Exception('not signed in');
  }
}
