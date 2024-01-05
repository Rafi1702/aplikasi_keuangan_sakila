import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/model/detail_pengeluaran_model.dart';
import 'package:sakila_store_project/services/detail_pengeluaran_service.dart';

part 'detail_pengeluaran_event.dart';
part 'detail_pengeluaran_state.dart';

class DetailPengeluaranBloc
    extends Bloc<DetailPengeluaranEvent, DetailPengeluaranState> {
  DetailPengeluaranBloc() : super(DetailPengeluaranLoading()) {
    on<GetDetailPengeluaranEvent>(getPengeluaranDetail);
  }

  void getPengeluaranDetail(
      GetDetailPengeluaranEvent event, Emitter emit) async {
    emit(DetailPengeluaranLoading());
    try {
      DetailPengeluaran detail =
          await DetailPengeluaranService().getDetailPengeluaran(id: event.id);

      emit(DetailPengeluaranLoaded(detail: detail));
    } catch (e) {
      emit(DetailPengeluaranError(error: e.toString()));
    }
  }
}
