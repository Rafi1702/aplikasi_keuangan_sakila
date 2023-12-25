import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart' as http;
import 'package:sakila_store_project/helper/shared_pref.dart';
import 'package:sakila_store_project/services/exception.dart';

class AuthService {
  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http
          .post(
            Uri.parse('http://10.0.2.2:3001/api/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(
              {"email": email, "password": password},
            ),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        SharedPref.saveCookie(cookie: response.headers['set-cookie']!);
      }
      if (response.statusCode == 401) {
        throw CustomException(jsonDecode(response.body)['message']);
      }
    } on SocketException catch (_) {
      throw CustomException("No Internet Connection");
    } on TimeoutException catch (e) {
      throw CustomException(e.message ?? 'Waktu Habis');
    }
  }
}
