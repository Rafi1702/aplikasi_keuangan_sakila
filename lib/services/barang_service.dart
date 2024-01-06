import 'dart:convert';
import 'dart:io';

import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/services/exception.dart';

class BarangService {
  Future<BarangModel> getBarang() async {
    try {
      final response = await HttpClient.client
          .get(Uri.parse('http://10.0.2.2:3001/api/barang'));
      print(response.body);

      return BarangModel.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw CustomException("Cek Koneksi Internet");
    }
  }
}
