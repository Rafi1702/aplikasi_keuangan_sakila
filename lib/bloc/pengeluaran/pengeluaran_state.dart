// part of 'pengeluaran_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';

enum PengeluaranStatus {
  initial,
  loading,
  loaded,
  error,
}

class PengeluaranState extends Equatable {
  const PengeluaranState({
    this.status = PengeluaranStatus.initial,
    this.pengeluaran = const [],
    this.errorMessage = '',
    this.failureMessage = '',
    this.isGetting = false,
    this.isInserting = false,
    this.isUpdating = false,
  });

  final bool isGetting;
  final bool isInserting;
  final bool isUpdating;

  final PengeluaranStatus status;
  final List<DataPengeluaran> pengeluaran;
  final String errorMessage;
  final String failureMessage;

  PengeluaranState copyWith(
      {PengeluaranStatus? status,
      List<DataPengeluaran>? pengeluaran,
      String? errorMessage,
      String? failureMessage,
      bool? isGetting,
      bool? isInserting,
      bool? isUpdating}) {
    return PengeluaranState(
        status: status ?? this.status,
        pengeluaran: pengeluaran ?? this.pengeluaran,
        errorMessage: errorMessage ?? this.errorMessage,
        failureMessage: failureMessage ?? this.failureMessage,
        isGetting: isGetting ?? this.isGetting,
        isInserting: isInserting ?? this.isInserting,
        isUpdating: isUpdating ?? this.isUpdating);
  }

  @override
  List<Object> get props =>
      [status, pengeluaran, errorMessage, isGetting, isUpdating, isInserting];
}
