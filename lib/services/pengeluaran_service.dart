import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/network/global_interceptor.dart';

class PengeluaranService {
  Future<Pengeluaran> getPengeluaran() async {
    print(HttpClient.API_KEY);
    final response = await HttpClient.client
        .get(Uri.parse('${HttpClient.API_KEY}/pengeluaran'));
    print(response.body);

    return Pengeluaran.fromJson(jsonDecode(response.body));
  }
}
