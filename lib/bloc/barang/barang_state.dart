part of 'barang_bloc.dart';

enum BarangStatus { initial, loading, loaded, error }

class BarangState extends Equatable {
  const BarangState({
    this.status = BarangStatus.initial,
    this.barang = const [],
    this.errorMessage = '',
  });
  final List<DataBarang> barang;
  final String errorMessage;
  final BarangStatus status;

  BarangState copyWith({
    BarangStatus? status,
    List<DataBarang>? barang,
    String? errorMessage,
  }) {
    return BarangState(
        status: status ?? this.status,
        barang: barang ?? this.barang,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [barang, errorMessage, status];
}

// final class BarangInitial extends BarangState {}

// final class BarangLoading extends BarangState {}

// final class BarangLoaded extends BarangState {
//   final List<DataBarang> barang;
//   const BarangLoaded({required this.barang});

//   @override
//   List<Object> get props => [barang];
// }

// final class BarangError extends BarangState {
//   final String error;
//   const BarangError({required this.error});

//   @override
//   List<Object> get props => [error];
// }
