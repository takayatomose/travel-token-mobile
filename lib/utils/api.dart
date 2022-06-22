import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:xtrip_mobile/utils/apiinterceptor.dart';

class ApiService {
  final Client httpClient =
      InterceptedClient.build(interceptors: [ApiInterceptor()]);
  static getHttpClient() {
    return Uri.https(
        dotenv.get('API_URL', fallback: 'https://api-prod.xtrip.travel'), '');
  }

  Future<http.Response> postAPI({required String uri, Object? body}) {
    return httpClient.post(Uri.parse('${getHttpClient()}$uri'), body: body);
  }

  Future<http.Response> getApi({required String uri}) {
    return httpClient.get(Uri.parse('${getHttpClient()}$uri'));
  }
}
