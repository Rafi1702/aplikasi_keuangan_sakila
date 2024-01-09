part of 'barang_bloc.dart';

sealed class BarangEvent extends Equatable {
  const BarangEvent();

  @override
  List<Object> get props => [];
}

class GetBarangEvent extends BarangEvent {}

class UpdatedBarangEvent extends BarangEvent {
  final String jenis;

  const UpdatedBarangEvent({required this.jenis});

  @override
  List<Object> get props => [jenis];
}

class InsertBarangEvent extends BarangEvent {
  final DataBarang barang;

  const InsertBarangEvent({required this.barang});

  @override
  List<Object> get props => [barang];
}

class TambahKuantitasEvent extends BarangEvent {
  final int id;

  const TambahKuantitasEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class KurangiKuantitasEvent extends BarangEvent {
  final int id;

  const KurangiKuantitasEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class ResetStokEvent extends BarangEvent {
  final String jenisTransaksi;

  const ResetStokEvent({required this.jenisTransaksi});

  @override
  List<Object> get props => [jenisTransaksi];
}
