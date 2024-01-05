part of 'detail_pengeluaran_bloc.dart';

sealed class DetailPengeluaranState extends Equatable {
  const DetailPengeluaranState();

  @override
  List<Object> get props => [];
}

final class DetailPengeluaranLoading extends DetailPengeluaranState {}

final class DetailPengeluaranLoaded extends DetailPengeluaranState {
  final DetailPengeluaran detail;

  const DetailPengeluaranLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}

final class DetailPengeluaranError extends DetailPengeluaranState {
  final String error;

  const DetailPengeluaranError({required this.error});

  @override
  List<Object> get props => [error];
}
