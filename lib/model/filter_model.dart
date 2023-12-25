class Filter {
  final int id;
  final String nama;
  final bool isActive;

  const Filter({required this.id, required this.nama, this.isActive = false});

  Filter copyWith({int? id, String? nama, bool? isActive}) {
    return Filter(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      isActive: isActive ?? this.isActive,
    );
  }
}
