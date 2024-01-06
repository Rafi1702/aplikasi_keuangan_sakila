import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_state.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';

import 'package:sakila_store_project/services/pengeluaran_service.dart';

part 'pengeluaran_event.dart';
// part 'pengeluaran_state.dart';

class PengeluaranBloc extends Bloc<PengeluaranEvent, PengeluaranState> {
  PengeluaranBloc()
      : super(const PengeluaranState(status: PengeluaranStatus.initial)) {
    on<GetAllPengeluaranEvent>(getAllPengeluaran);
    on<InsertPengeluaranEvent>(insertPengeluaran);
  }

  void getAllPengeluaran(
    GetAllPengeluaranEvent pengeluaran,
    Emitter emit,
  ) async {
    emit(state.copyWith(status: PengeluaranStatus.loading));

    try {
      Pengeluaran pengeluaran = await PengeluaranService().getPengeluaran();

      emit(state.copyWith(
          status: PengeluaranStatus.loaded, pengeluaran: pengeluaran.data));
    } catch (e) {
      emit(state.copyWith(
          status: PengeluaranStatus.error, errorMessage: e.toString()));
    }
  }

  void insertPengeluaran(InsertPengeluaranEvent event, Emitter emit) async {
    // List<DataPengeluaran> currentData = currentState.pengeluaran;
    emit(state.copyWith(status: PengeluaranStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    try {
      List<DataBarang> filteredBarang =
          event.barang.where((e) => e.kuantitas! > 0).toList();
      DataPengeluaran data = await PengeluaranService()
          .insertPengeluaran(event.tanggalPengeluaran, filteredBarang);
      List<DataPengeluaran> updatedData = [...state.pengeluaran, data];

      emit(state.copyWith(
          status: PengeluaranStatus.loaded, pengeluaran: updatedData));
    } catch (e) {
      emit(state.copyWith(
          status: PengeluaranStatus.error, errorMessage: e.toString()));
    }
  }
}
