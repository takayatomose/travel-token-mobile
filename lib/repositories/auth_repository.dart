import 'package:http/http.dart' as http;
import 'package:xtrip_mobile/utils/api.dart';
import 'dart:convert';

class AuthRepository {
  final apiService = ApiService();
  Future<http.Response> signup(
      {required String invitationCode,
      required String email,
      required String fullName,
      required String password}) async {
    final response = await apiService.postAPI(
        uri: '/auth/register',
        body: json.encode({
          'invitationCode': invitationCode,
          'email': email,
          'fullName': fullName,
          'password': password
        }));
    return response;
  }

  Future<http.Response?> signin(
      {required String email, required String password}) async {
    return apiService.postAPI(
        uri: '/auth/login',
        body: json.encode({'email': email, 'password': password}));
  }

  Future<http.Response> forgotPassword({required String email}) async {
    return http.post(
        Uri.parse('${ApiService.getHttpClient()}/auth/forgot-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({'email': email}));
  }

  Future<http.Response> resetPassword(
      {required String email,
      required String code,
      required String password}) async {
    return http.post(
        Uri.parse('${ApiService.getHttpClient()}/auth/reset-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body:
            json.encode({'email': email, 'password': password, 'code': code}));
  }

  Future attemptAutoLogin() async {
    throw Exception('not signed in');
  }

  Future<http.Response> activateUser(
      {required String email, required String code}) async {
    return http.post(Uri.parse('${ApiService.getHttpClient()}/auth/activate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({'email': email, 'activationCode': code}));
  }
}
