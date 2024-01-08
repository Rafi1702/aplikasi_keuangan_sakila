part of 'barang_bloc.dart';

enum BarangStatus { initial, loading, loaded, error }

class BarangState extends Equatable {
  const BarangState({
    this.status = BarangStatus.initial,
    this.isFetching = false,
    this.isInserting = false,
    this.isUpdating = false,
    this.isDeleting = false,
    this.barang = const [],
    this.errorMessage = '',
  });

  final bool isFetching;
  final bool isInserting;
  final bool isUpdating;
  final bool isDeleting;
  final List<DataBarang> barang;
  final String errorMessage;
  final BarangStatus status;

  BarangState copyWith(
      {BarangStatus? status,
      List<DataBarang>? barang,
      String? errorMessage,
      bool? isFetching,
      bool? isInserting,
      bool? isUpdating,
      bool? isDeleting}) {
    return BarangState(
      status: status ?? this.status,
      barang: barang ?? this.barang,
      errorMessage: errorMessage ?? this.errorMessage,
      isFetching: isFetching ?? this.isFetching,
      isInserting: isInserting ?? this.isInserting,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object> get props => [
        barang,
        errorMessage,
        status,
        isFetching,
        isInserting,
        isUpdating,
        isDeleting
      ];
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
