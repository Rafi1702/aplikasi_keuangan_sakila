part of 'pengeluaran_bloc.dart';

sealed class PengeluaranEvent extends Equatable {
  const PengeluaranEvent();

  @override
  List<Object> get props => [];
}

class GetAllPengeluaranEvent extends PengeluaranEvent {}

class InsertPengeluaranEvent extends PengeluaranEvent {
  final String tanggalPengeluaran;
  final List<DataBarang> barang;

  const InsertPengeluaranEvent(
      {required this.barang, required this.tanggalPengeluaran});

  @override
  List<Object> get props => [tanggalPengeluaran, barang];
}
