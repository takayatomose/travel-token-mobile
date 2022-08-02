import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:xtrip_mobile/models/paginate_document.dart';
import 'package:xtrip_mobile/utils/apiinterceptor.dart';

class ApiService {
  final Client httpClient =
      InterceptedClient.build(interceptors: [ApiInterceptor()]);
  static const API_URL =
      String.fromEnvironment('API_URL', defaultValue: 'api-prod.xtrip.travel');
  static getHttpClient() {
    if (const String.fromEnvironment('APP_SSL', defaultValue: 'true') ==
        'false') {
      return Uri.http(API_URL, '');
    } else {
      return Uri.https(API_URL, '');
    }
  }

  Future<http.Response> postAPI({required String uri, Object? body}) {
    return httpClient.post(Uri.parse('${getHttpClient()}$uri'), body: body);
  }

  Future<http.Response> patchAPI({required String uri, Object? body}) {
    return httpClient.patch(Uri.parse('${getHttpClient()}$uri'), body: body);
  }

  Future<http.Response> getAPI({required String uri}) {
    return httpClient.get(Uri.parse('${getHttpClient()}$uri'));
  }

  PaginateDocument paginationBody(String body) {
    Map<String, dynamic> bodyJson = json.decode(body);

    return PaginateDocument.fromJson(bodyJson);
  }
}
