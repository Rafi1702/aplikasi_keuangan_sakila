import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/pengeluaran_model.dart';
import 'package:sakila_store_project/services/pengeluaran_service.dart';

part 'pengeluaran_event.dart';
part 'pengeluaran_state.dart';

class PengeluaranBloc extends Bloc<PengeluaranEvent, PengeluaranState> {
  PengeluaranBloc() : super(PengeluaranLoading()) {
    on<GetAllPengeluaranEvent>(getAllPengeluaran);
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
}
