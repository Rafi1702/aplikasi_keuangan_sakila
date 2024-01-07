// part of 'pengeluaran_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';

enum PengeluaranStatus {
  initial,
  loading,
  loaded,
  error,
  pending,
  failure,
  success
}

class PengeluaranState extends Equatable {
  const PengeluaranState({
    this.status = PengeluaranStatus.initial,
    this.pengeluaran = const [],
    this.errorMessage = '',
    this.failureMessage = '',
  });

  // final bool isGetting;
  // final bool isInserting;
  // final bool isUpdating;

  final PengeluaranStatus status;
  final List<DataPengeluaran> pengeluaran;
  final String errorMessage;
  final String failureMessage;

  PengeluaranState copyWith(
      {PengeluaranStatus? status,
      List<DataPengeluaran>? pengeluaran,
      String? errorMessage,
      String? failureMessage}) {
    return PengeluaranState(
        status: status ?? this.status,
        pengeluaran: pengeluaran ?? this.pengeluaran,
        errorMessage: errorMessage ?? this.errorMessage,
        failureMessage: failureMessage ?? this.failureMessage);
  }

  @override
  List<Object> get props => [status, pengeluaran, errorMessage];
}
