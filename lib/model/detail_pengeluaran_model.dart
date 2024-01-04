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
