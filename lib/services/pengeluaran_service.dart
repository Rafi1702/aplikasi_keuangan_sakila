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
          .get(Uri.parse('${HttpClient.API_URL}/pengeluaran'));
      if (response.statusCode == 500) {
        throw CustomException(HttpClient.errorDecoder(response));
      }

      return Pengeluaran.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw CustomException("Cek Koneksi");
    }
  }

  Future<DataPengeluaran> insertPengeluaran(
      String tanggal, List<DataBarang> barang) async {
    try {
      final barangList = barang
          .map((data) => {
                'id_barang': data.idBarang,
                'kuantitas': data.kuantitas,
              })
          .toList();

      final reqBody = jsonEncode({
        "tanggal_pengeluaran": tanggal,
        "barang": barangList,
      });

      final response = await HttpClient.client
          .post(Uri.parse('${HttpClient.API_URL}/pengeluaran'), body: reqBody);

      if (response.statusCode == 409) {
        throw CustomException(HttpClient.errorDecoder(response));
      }

      if (response.statusCode == 400) {
        throw CustomException(HttpClient.errorDecoder(response));
      }

      if (response.statusCode == 500) {
        throw CustomException(HttpClient.errorDecoder(response));
      }

      return DataPengeluaran.fromJson(jsonDecode(response.body)['data']);
    } on SocketException {
      throw CustomException(SOCKET_EXCEPTION);
    }
  }

  Future<void> deletePengeluaran(int id) async {
    try {
      final response = await HttpClient.client
          .delete(Uri.parse('${HttpClient.API_URL}/pengeluaran/$id'));

      if (response.statusCode == 409) {
        throw CustomException(HttpClient.errorDecoder(response));
      }

      if (response.statusCode == 400) {
        throw CustomException(HttpClient.errorDecoder(response));
      }
    } on SocketException {
      throw CustomException(SOCKET_EXCEPTION);
    }
  }
}
