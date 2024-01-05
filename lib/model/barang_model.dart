// To parse this JSON data, do
//
//     final barang = barangFromJson(jsonString);

import 'dart:convert';

import 'package:sakila_store_project/model/detail_pengeluaran_model.dart';

BarangModel barangFromJson(String str) =>
    BarangModel.fromJson(json.decode(str));

String barangToJson(Barang data) => json.encode(data.toJson());

class BarangModel {
  List<DataBarang> data;

  BarangModel({
    required this.data,
  });

  BarangModel copyWith({
    List<DataBarang>? data,
  }) =>
      BarangModel(
        data: data ?? this.data,
      );

  factory BarangModel.fromJson(Map<String, dynamic> json) => BarangModel(
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
  DetailPengeluaran? detailPengeluaran;
  int? kuantitas;

  DataBarang({
    required this.idBarang,
    required this.namaBarang,
    required this.jenisBarang,
    required this.stokBarang,
    required this.hargaBarang,
    this.detailPengeluaran,
    this.kuantitas = 0,
  });

  DataBarang copyWith({
    int? idBarang,
    String? namaBarang,
    String? jenisBarang,
    int? stokBarang,
    int? hargaBarang,
    DetailPengeluaran? detailPengeluaran,
    int? kuantitas,
  }) =>
      DataBarang(
        idBarang: idBarang ?? this.idBarang,
        namaBarang: namaBarang ?? this.namaBarang,
        jenisBarang: jenisBarang ?? this.jenisBarang,
        stokBarang: stokBarang ?? this.stokBarang,
        hargaBarang: hargaBarang ?? this.hargaBarang,
        detailPengeluaran: detailPengeluaran ?? this.detailPengeluaran,
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
        // "nama_barang": namaBarang,
        // "jenis_barang": jenisBarang,
        // "stok_barang": stokBarang,
        // "harga_barang": hargaBarang,
        "kuantitas": kuantitas,
      };
}
