// To parse this JSON data, do
//
//     final pengeluaran = pengeluaranFromJson(jsonString);

import 'dart:convert';

Pengeluaran pengeluaranFromJson(String str) =>
    Pengeluaran.fromJson(json.decode(str));

String pengeluaranToJson(Pengeluaran data) => json.encode(data.toJson());

class Pengeluaran {
  List<DataPengeluaran> data;

  Pengeluaran({
    required this.data,
  });

  Pengeluaran copyWith({
    List<DataPengeluaran>? data,
  }) =>
      Pengeluaran(
        data: data ?? this.data,
      );

  factory Pengeluaran.fromJson(Map<String, dynamic> json) => Pengeluaran(
        data: List<DataPengeluaran>.from(
            json["data"].map((x) => DataPengeluaran.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataPengeluaran {
  int idPengeluaran;
  DateTime tanggalPengeluaran;

  DataPengeluaran({
    required this.idPengeluaran,
    required this.tanggalPengeluaran,
  });

  DataPengeluaran copyWith({
    int? idPengeluaran,
    DateTime? tanggalPengeluaran,
  }) =>
      DataPengeluaran(
        idPengeluaran: idPengeluaran ?? this.idPengeluaran,
        tanggalPengeluaran: tanggalPengeluaran ?? this.tanggalPengeluaran,
      );

  factory DataPengeluaran.fromJson(Map<String, dynamic> json) =>
      DataPengeluaran(
        idPengeluaran: json["id_pengeluaran"],
        tanggalPengeluaran: DateTime.parse(json["tanggal_pengeluaran"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pengeluaran": idPengeluaran,
        "tanggal_pengeluaran":
            "${tanggalPengeluaran.year.toString().padLeft(4, '0')}-${tanggalPengeluaran.month.toString().padLeft(2, '0')}-${tanggalPengeluaran.day.toString().padLeft(2, '0')}",
      };
}
