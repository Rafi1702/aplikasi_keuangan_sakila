import 'dart:convert';

import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/network/api_client.dart';

class BarangService {
  Future<Barang> getBarang() async {
    final response = await HttpClient.client
        .get(Uri.parse('http://10.0.2.2:3001/api/barang'));
    print(response.body);

    return Barang.fromJson(jsonDecode(response.body));
  }
}
