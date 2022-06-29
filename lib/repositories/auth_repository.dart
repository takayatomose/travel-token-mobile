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
    final response = await apiService.postAPI(
        uri: '/auth/login',
        body: json.encode({'email': email, 'password': password}));
    return response;
  }

  Future<http.Response> forgotPassword({required String email}) async {
    final response = await apiService.postAPI(
        uri: '/auth/forgot-password', body: json.encode({'email': email}));
    return response;
  }

  Future<http.Response> resetPassword(
      {required String email,
      required String code,
      required String password}) async {
    final response = await apiService.patchAPI(
        uri: '/auth/reset-password',
        body:
            json.encode({'email': email, 'password': password, 'code': code}));
    return response;
  }

  Future attemptAutoLogin() async {
    throw Exception('not signed in');
  }

  Future<http.Response> activateUser(
      {required String email, required String code}) async {
    final response = await apiService.patchAPI(
        uri: '/auth/activate',
        body: json.encode({'email': email, 'activationCode': code}));
    return response;
  }
}
