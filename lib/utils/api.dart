import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:xtrip_mobile/models/paginate_document.dart';
import 'package:xtrip_mobile/utils/apiinterceptor.dart';

class ApiService {
  final Client httpClient =
      InterceptedClient.build(interceptors: [ApiInterceptor()]);
  static getHttpClient() {
    if (dotenv.get('APP_SSL') == 'false') {
      return Uri.https(
          dotenv.get('API_URL', fallback: 'api-prod.xtrip.travel'), '');
    } else {
      return Uri.http(
          dotenv.get('API_URL', fallback: 'api-prod.xtrip.travel'), '');
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
