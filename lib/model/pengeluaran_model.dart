// To parse this JSON data, do
//
//     final pengeluaran = pengeluaranFromJson(jsonString);

import 'dart:convert';

import 'package:sakila_store_project/model/barang_model.dart';

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
  List<Barang> barangs;

  Data({
    required this.idPengeluaran,
    required this.tanggalPengeluaran,
    required this.barangs,
  });

  Data copyWith({
    int? idPengeluaran,
    DateTime? tanggalPengeluaran,
    List<Barang>? barangs,
  }) =>
      Data(
        idPengeluaran: idPengeluaran ?? this.idPengeluaran,
        tanggalPengeluaran: tanggalPengeluaran ?? this.tanggalPengeluaran,
        barangs: barangs ?? this.barangs,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idPengeluaran: json["id_pengeluaran"],
        tanggalPengeluaran: DateTime.parse(json["tanggal_pengeluaran"]),
        barangs:
            List<Barang>.from(json["barangs"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_pengeluaran": idPengeluaran,
        "tanggal_pengeluaran": tanggalPengeluaran.toIso8601String(),
        "barangs": List<dynamic>.from(barangs.map((x) => x.toJson())),
      };
}

// class Barang {
//   int idBarang;
//   String namaBarang;
//   int hargaBarang;
//   DetailPengeluaran detailPengeluaran;

//   Barang({
//     required this.idBarang,
//     required this.namaBarang,
//     required this.hargaBarang,
//     required this.detailPengeluaran,
//   });

//   Barang copyWith({
//     int? idBarang,
//     String? namaBarang,
//     int? hargaBarang,
//     DetailPengeluaran? detailPengeluaran,
//   }) =>
//       Barang(
//         idBarang: idBarang ?? this.idBarang,
//         namaBarang: namaBarang ?? this.namaBarang,
//         hargaBarang: hargaBarang ?? this.hargaBarang,
//         detailPengeluaran: detailPengeluaran ?? this.detailPengeluaran,
//       );

//   factory Barang.fromJson(Map<String, dynamic> json) => Barang(
//         idBarang: json["id_barang"],
//         namaBarang: json["nama_barang"],
//         hargaBarang: json["harga_barang"],
//         detailPengeluaran:
//             DetailPengeluaran.fromJson(json["detail_pengeluaran"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id_barang": idBarang,
//         "nama_barang": namaBarang,
//         "harga_barang": hargaBarang,
//         "detail_pengeluaran": detailPengeluaran.toJson(),
//       };
// }

class DetailPengeluaran {
  int kuantitas;
  int totalHarga;

  DetailPengeluaran({
    required this.kuantitas,
    required this.totalHarga,
  });

  DetailPengeluaran copyWith({
    int? kuantitas,
    int? totalHarga,
  }) =>
      DetailPengeluaran(
        kuantitas: kuantitas ?? this.kuantitas,
        totalHarga: totalHarga ?? this.totalHarga,
      );

  factory DetailPengeluaran.fromJson(Map<String, dynamic> json) =>
      DetailPengeluaran(
        kuantitas: json["kuantitas"],
        totalHarga: json["total_harga"],
      );

  Map<String, dynamic> toJson() => {
        "kuantitas": kuantitas,
        "total_harga": totalHarga,
      };
}
