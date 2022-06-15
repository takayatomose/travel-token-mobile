// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:xtrip_mobile/utils/api.dart';
// import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier {
//   // String _token;

//   Future<void> signup(String invitationCode, String fullName, String email,
//       String password) async {
//     final url = '${Api.getHttpClient()}/user';
//     final response = await http.post(Uri.parse('${Api.getHttpClient()}/user'),
//         body: json.encode({
//           'invitationCode': invitationCode,
//           'email': email,
//           'fullName': fullName,
//           'password': password
//         }));
//   }
// }
