// part of 'pengeluaran_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';

enum PengeluaranStatus { initial, loading, loaded, error }

class PengeluaranState extends Equatable {
  const PengeluaranState(
      {this.status = PengeluaranStatus.initial,
      this.pengeluaran = const [],
      this.errorMessage = ''});

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
  List<Object> get props => [status, pengeluaran, errorMessage];
}
