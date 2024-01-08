import 'dart:convert';
import 'dart:io';

import 'package:sakila_store_project/model/detail_pengeluaran_model.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/services/exception.dart';

class DetailPengeluaranService {
  Future<DetailPengeluaran> getDetailPengeluaran({required int id}) async {
    try {
      final response = await HttpClient.client
          .get(Uri.parse('${HttpClient.API_URL}/pengeluaran/$id'));

      return DetailPengeluaran.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw CustomException(SOCKET_EXCEPTION);
    }
  }
}
