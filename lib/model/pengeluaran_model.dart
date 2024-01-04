// To parse this JSON data, do
//
//     final pengeluaran = pengeluaranFromJson(jsonString);

import 'dart:convert';

Pengeluaran pengeluaranFromJson(String str) =>
    Pengeluaran.fromJson(json.decode(str));

String pengeluaranToJson(Pengeluaran data) => json.encode(data.toJson());

class Pengeluaran {
  List<Data> data;

  Pengeluaran({
    required this.data,
  });

  Pengeluaran copyWith({
    List<Data>? data,
  }) =>
      Pengeluaran(
        data: data ?? this.data,
      );

  factory Pengeluaran.fromJson(Map<String, dynamic> json) => Pengeluaran(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int idPengeluaran;
  DateTime tanggalPengeluaran;

  Data({
    required this.idPengeluaran,
    required this.tanggalPengeluaran,
  });

  Data copyWith({
    int? idPengeluaran,
    DateTime? tanggalPengeluaran,
  }) =>
      Data(
        idPengeluaran: idPengeluaran ?? this.idPengeluaran,
        tanggalPengeluaran: tanggalPengeluaran ?? this.tanggalPengeluaran,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idPengeluaran: json["id_pengeluaran"],
        tanggalPengeluaran: DateTime.parse(json["tanggal_pengeluaran"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pengeluaran": idPengeluaran,
        "tanggal_pengeluaran": tanggalPengeluaran.toIso8601String(),
      };
}
