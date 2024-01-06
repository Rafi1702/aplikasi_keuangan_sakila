// part of 'pengeluaran_bloc.dart';

// sealed class PengeluaranState extends Equatable {
//   const PengeluaranState();

//   @override
//   List<Object> get props => [];
// }

// final class PengeluaranInitial extends PengeluaranState {}

// final class PengeluaranLoading extends PengeluaranState {}

// final class PengeluaranLoaded extends PengeluaranState {
//   final List<DataPengeluaran> pengeluaran;
//   const PengeluaranLoaded({required this.pengeluaran});

//   @override
//   List<Object> get props => [pengeluaran];
// }

// final class PengeluaranError extends PengeluaranState {
//   final String error;
//   const PengeluaranError({required this.error});

//   @override
//   List<Object> get props => [error];
// }

import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';

enum PengeluaranStatus { initial, loading, loaded, error }

class PengeluaranState extends Equatable {
  const PengeluaranState(
      {this.status = PengeluaranStatus.initial,
      this.pengeluaran = const [],
      this.errorMessage = ''});

  // const PengeluaranState.loading() : this._(status: PengeluaranStatus.loading);

  // const PengeluaranState.loaded(List<DataPengeluaran> pengeluaran)
  //     : this._(status: PengeluaranStatus.loaded, pengeluaran: pengeluaran);

  // const PengeluaranState.error(String errorMessage)
  //     : this._(status: PengeluaranStatus.error, errorMessage: errorMessage);

  final PengeluaranStatus status;
  final List<DataPengeluaran> pengeluaran;
  final String errorMessage;

  PengeluaranState copyWith(
      {PengeluaranStatus? status,
      List<DataPengeluaran>? pengeluaran,
      String? errorMessage}) {
    return PengeluaranState(
        status: status ?? this.status,
        pengeluaran: pengeluaran ?? this.pengeluaran,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [status, pengeluaran];
}
