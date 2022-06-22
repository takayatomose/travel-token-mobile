import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:xtrip_mobile/constants/user_constants.dart';

class ApiInterceptor implements InterceptorContract {
  final _secureStorage = const FlutterSecureStorage();

  Future<String> get tokenOrEmpty async {
    var token = await _secureStorage.read(key: USER_TOKEN);
    if (token == null) return '';
    return token;
  }

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    String token = await tokenOrEmpty;
    try {
      data.headers['Authorization'] = 'Bearer $token';
      data.headers['Content-Type'] = 'application/json; charset=UTF-8';
    } on Exception catch (e) {}
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
