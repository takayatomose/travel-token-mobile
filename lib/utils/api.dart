import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class Api {
  // final url = dotenv.get('API_URL', fallback: 'https://');
  static getHttpClient() {
    return Uri.http(
        dotenv.get('API_URL', fallback: 'https://api-prod.xtrip.travel'), '');
  }
}
