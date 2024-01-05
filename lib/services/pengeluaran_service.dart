import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/model/detail_pengeluaran_model.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/network/global_interceptor.dart';
import 'package:sakila_store_project/services/exception.dart';

class PengeluaranService {
  Future<Pengeluaran> getPengeluaran() async {
    print(HttpClient.API_KEY);

    try {
      final response = await HttpClient.client
          .get(Uri.parse('${HttpClient.API_KEY}/pengeluaran'));
      print(response.body);

      return Pengeluaran.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw CustomException("Cek Koneksi");
    }
  }

  Future<DataPengeluaran> insertPengeluaran(
      String tanggal, List<DataBarang> barang) async {
    try {
      List<Map<String, dynamic>> barangList =
          barang.map((item) => item.toJson()).toList();

      print("MASUK NIH");
      final response = await HttpClient.client.post(
        Uri.parse('${HttpClient.API_KEY}/pengeluaran'),
        body: jsonEncode({
          "tanggal_pengeluaran": tanggal,
          "barang": barangList,
        }),
      );

      if (response.statusCode == 400) {
        throw CustomException(jsonDecode(response.body)['message']);
      }

      return DataPengeluaran.fromJson(jsonDecode(response.body)['data']);
    } on SocketException {
      throw CustomException("Cek Koneksi Internet Anda");
    } on Exception {
      throw CustomException("Test");
    }
  }
}
