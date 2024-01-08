import 'dart:convert';
import 'dart:io';

import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/services/exception.dart';

class BarangService {
  Future<BarangModel> getBarang() async {
    try {
      final response = await HttpClient.client
          .get(Uri.parse('${HttpClient.API_URL}/barang'));

      return BarangModel.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw CustomException(SOCKET_EXCEPTION);
    }
  }

  Future<DataBarang> insertBarang(DataBarang barang) async {
    try {
      final response = await HttpClient.client.post(
          Uri.parse('${HttpClient.API_URL}/barang'),
          body: jsonEncode(barang.toJson()));

      return DataBarang.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw CustomException(SOCKET_EXCEPTION);
    }
  }
}
