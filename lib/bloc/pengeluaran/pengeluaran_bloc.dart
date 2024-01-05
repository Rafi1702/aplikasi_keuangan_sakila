import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';
import 'package:sakila_store_project/services/exception.dart';
import 'package:sakila_store_project/services/pengeluaran_service.dart';

part 'pengeluaran_event.dart';
part 'pengeluaran_state.dart';

class PengeluaranBloc extends Bloc<PengeluaranEvent, PengeluaranState> {
  PengeluaranBloc() : super(PengeluaranLoading()) {
    on<GetAllPengeluaranEvent>(getAllPengeluaran);
    on<InsertPengeluaranEvent>(insertPengeluaran);
  }

  void getAllPengeluaran(
    GetAllPengeluaranEvent pengeluaran,
    Emitter emit,
  ) async {
    try {
      Pengeluaran pengeluaran = await PengeluaranService().getPengeluaran();

      emit(PengeluaranLoaded(pengeluaran: pengeluaran.data));
    } catch (e) {
      emit(PengeluaranError(error: e.toString()));
    }
  }

  void insertPengeluaran(InsertPengeluaranEvent event, Emitter emit) async {
    try {
      final currentState = state;
      if (currentState is PengeluaranLoaded) {
        List<DataBarang> filteredBarang =
            event.barang.where((e) => e.kuantitas! > 0).toList();
        DataPengeluaran data = await PengeluaranService()
            .insertPengeluaran(event.tanggalPengeluaran, filteredBarang);
        List<DataPengeluaran> updatedData = [...currentState.pengeluaran, data];

        emit(PengeluaranLoaded(pengeluaran: updatedData));
      }
    } catch (e) {
      emit(PengeluaranError(error: e.toString()));
    }
  }
}
