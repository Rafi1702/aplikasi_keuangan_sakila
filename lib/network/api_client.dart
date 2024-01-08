import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sakila_store_project/network/global_interceptor.dart';

class HttpClient {
  static const API_URL = "http://10.0.2.2:3001/api";

  static String errorDecoder(Response? response) {
    if (response == null) {
      return '';
    }
    return jsonDecode(response.body)['message'];
  }

  static Client client = InterceptedClient.build(interceptors: [
    GlobalInterceptor(),
  ]);
}
