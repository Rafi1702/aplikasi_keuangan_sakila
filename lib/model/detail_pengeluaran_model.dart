// To parse this JSON data, do
//
//     final detailPengeluaran = detailPengeluaranFromJson(jsonString);

import 'dart:convert';

DetailPengeluaran detailPengeluaranFromJson(String str) =>
    DetailPengeluaran.fromJson(json.decode(str));

String detailPengeluaranToJson(DetailPengeluaran data) =>
    json.encode(data.toJson());

class DetailPengeluaran {
  Data data;

  DetailPengeluaran({
    required this.data,
  });

  DetailPengeluaran copyWith({
    Data? data,
  }) =>
      DetailPengeluaran(
        data: data ?? this.data,
      );

  factory DetailPengeluaran.fromJson(Map<String, dynamic> json) =>
      DetailPengeluaran(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  DateTime tanggalPengeluaran;
  int idPengeluaran;
  int idUser;
  List<Barang> barangs;

  Data({
    required this.tanggalPengeluaran,
    required this.idPengeluaran,
    required this.idUser,
    required this.barangs,
  });

  Data copyWith({
    DateTime? tanggalPengeluaran,
    int? idPengeluaran,
    int? idUser,
    List<Barang>? barangs,
  }) =>
      Data(
        tanggalPengeluaran: tanggalPengeluaran ?? this.tanggalPengeluaran,
        idPengeluaran: idPengeluaran ?? this.idPengeluaran,
        idUser: idUser ?? this.idUser,
        barangs: barangs ?? this.barangs,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tanggalPengeluaran: DateTime.parse(json["tanggal_pengeluaran"]),
        idPengeluaran: json["id_pengeluaran"],
        idUser: json["id_user"],
        barangs:
            List<Barang>.from(json["barangs"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal_pengeluaran":
            "${tanggalPengeluaran.year.toString().padLeft(4, '0')}-${tanggalPengeluaran.month.toString().padLeft(2, '0')}-${tanggalPengeluaran.day.toString().padLeft(2, '0')}",
        "id_pengeluaran": idPengeluaran,
        "id_user": idUser,
        "barangs": List<dynamic>.from(barangs.map((x) => x.toJson())),
      };
}

class Barang {
  int idBarang;
  String namaBarang;
  int hargaBarang;
  Detail detailPengeluaran;

  Barang({
    required this.idBarang,
    required this.namaBarang,
    required this.hargaBarang,
    required this.detailPengeluaran,
  });

  Barang copyWith({
    int? idBarang,
    String? namaBarang,
    int? hargaBarang,
    Detail? detailPengeluaran,
  }) =>
      Barang(
        idBarang: idBarang ?? this.idBarang,
        namaBarang: namaBarang ?? this.namaBarang,
        hargaBarang: hargaBarang ?? this.hargaBarang,
        detailPengeluaran: detailPengeluaran ?? this.detailPengeluaran,
      );

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idBarang: json["id_barang"],
        namaBarang: json["nama_barang"],
        hargaBarang: json["harga_barang"],
        detailPengeluaran: Detail.fromJson(json["detail_pengeluaran"]),
      );

  Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "nama_barang": namaBarang,
        "harga_barang": hargaBarang,
        "detail_pengeluaran": detailPengeluaran.toJson(),
      };
}

class Detail {
  int kuantitas;
  int totalHarga;

  Detail({
    required this.kuantitas,
    required this.totalHarga,
  });

  Detail copyWith({
    int? kuantitas,
    int? totalHarga,
  }) =>
      Detail(
        kuantitas: kuantitas ?? this.kuantitas,
        totalHarga: totalHarga ?? this.totalHarga,
      );

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        kuantitas: json["kuantitas"],
        totalHarga: json["total_harga"],
      );

  Map<String, dynamic> toJson() => {
        "kuantitas": kuantitas,
        "total_harga": totalHarga,
      };
}
