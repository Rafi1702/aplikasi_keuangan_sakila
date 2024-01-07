import 'dart:convert';
import 'dart:io';

import 'package:sakila_store_project/model/barang_model.dart';

import 'package:sakila_store_project/model/pengeluaran_model.dart';
import 'package:sakila_store_project/network/api_client.dart';

import 'package:sakila_store_project/services/exception.dart';

class PengeluaranService {
  Future<Pengeluaran> getPengeluaran() async {
    try {
      final response = await HttpClient.client
          .get(Uri.parse('${HttpClient.API_KEY}/pengeluaran'));

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

      final reqBody = jsonEncode({
        "tanggal_pengeluaran": tanggal,
        "barang": barangList,
      });

      final response = await HttpClient.client
          .post(Uri.parse('${HttpClient.API_KEY}/pengeluaran'), body: reqBody);

      final errMessage = jsonDecode(response.body)['message'];

      if (response.statusCode == 409) {
        throw CustomException(errMessage);
      }

      if (response.statusCode == 400) {
        throw CustomException(errMessage);
      }

      return DataPengeluaran.fromJson(jsonDecode(response.body)['data']);
    } on SocketException {
      throw CustomException("Cek Koneksi Internet Anda");
    }
  }

  Future<void> deletePengeluaran(int id) async {
    try {
      final response = await HttpClient.client
          .delete(Uri.parse('${HttpClient.API_KEY}/pengeluaran/$id'));

      final errMessage = jsonDecode(response.body)['message'];

      if (response.statusCode == 409) {
        throw CustomException(errMessage);
      }

      if (response.statusCode == 400) {
        throw CustomException(errMessage);
      }
    } on SocketException {
      throw CustomException("Cek Koneksi Internet Anda");
    }
  }
}
