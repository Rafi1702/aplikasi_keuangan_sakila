import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/network/global_interceptor.dart';

class PengeluaranService {
  Future<Pengeluaran> getPengeluaran() async {
    final response = await HttpClient.client
        .get(Uri.parse('http://10.0.2.2:3001/api/laporan'));
    print(response.body);

    return Pengeluaran.fromJson(jsonDecode(response.body));
  }
}
