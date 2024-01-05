part of 'pengeluaran_bloc.dart';

sealed class PengeluaranState extends Equatable {
  const PengeluaranState();

  @override
  List<Object> get props => [];
}

final class PengeluaranLoading extends PengeluaranState {}

final class PengeluaranLoaded extends PengeluaranState {
  final List<DataPengeluaran> pengeluaran;
  const PengeluaranLoaded({required this.pengeluaran});

  @override
  List<Object> get props => [pengeluaran];
}

final class PengeluaranError extends PengeluaranState {
  final String error;
  const PengeluaranError({required this.error});

  @override
  List<Object> get props => [error];
}
