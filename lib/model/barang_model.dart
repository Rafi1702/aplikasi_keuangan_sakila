// To parse this JSON data, do
//
//     final barang = barangFromJson(jsonString);

import 'dart:convert';

Barang barangFromJson(String str) => Barang.fromJson(json.decode(str));

String barangToJson(Barang data) => json.encode(data.toJson());

class Barang {
  List<DataBarang> data;

  Barang({
    required this.data,
  });

  Barang copyWith({
    List<DataBarang>? data,
  }) =>
      Barang(
        data: data ?? this.data,
      );

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        data: List<DataBarang>.from(
            json["data"].map((x) => DataBarang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataBarang {
  int idBarang;
  String namaBarang;
  String jenisBarang;
  int stokBarang;
  int hargaBarang;
  int? kuantitas;

  DataBarang({
    required this.idBarang,
    required this.namaBarang,
    required this.jenisBarang,
    required this.stokBarang,
    required this.hargaBarang,
    this.kuantitas = 0,
  });

  DataBarang copyWith({
    int? idBarang,
    String? namaBarang,
    String? jenisBarang,
    int? stokBarang,
    int? hargaBarang,
    int? kuantitas,
  }) =>
      DataBarang(
        idBarang: idBarang ?? this.idBarang,
        namaBarang: namaBarang ?? this.namaBarang,
        jenisBarang: jenisBarang ?? this.jenisBarang,
        stokBarang: stokBarang ?? this.stokBarang,
        hargaBarang: hargaBarang ?? this.hargaBarang,
        kuantitas: kuantitas ?? this.kuantitas,
      );

  factory DataBarang.fromJson(Map<String, dynamic> json) => DataBarang(
        idBarang: json["id_barang"],
        namaBarang: json["nama_barang"],
        jenisBarang: json["jenis_barang"],
        stokBarang: json["stok_barang"],
        hargaBarang: json["harga_barang"],
      );

  Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "nama_barang": namaBarang,
        "jenis_barang": jenisBarang,
        "stok_barang": stokBarang,
        "harga_barang": hargaBarang,
      };
}
