part of 'barang_bloc.dart';

sealed class BarangState extends Equatable {
  const BarangState();

  @override
  List<Object> get props => [];
}

final class BarangInitial extends BarangState {}

final class BarangLoading extends BarangState {}

final class BarangLoaded extends BarangState {
  final List<DataBarang> barang;
  const BarangLoaded({required this.barang});

  @override
  List<Object> get props => [barang];
}

final class BarangError extends BarangState {
  final String error;
  const BarangError({required this.error});

  @override
  List<Object> get props => [error];
}
