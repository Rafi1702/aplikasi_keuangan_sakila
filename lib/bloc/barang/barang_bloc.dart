import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/services/barang_service.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  BarangBloc() : super(const BarangState(status: BarangStatus.initial)) {
    on<GetBarangEvent>(getBarang);
    on<TambahKuantitasEvent>(tambahKuantitas);
    on<KurangiKuantitasEvent>(kurangiKuantitas);
    on<ResetStokEvent>(resetStok);
  }
  void getBarang(GetBarangEvent event, Emitter emit) async {
    emit(state.copyWith(status: BarangStatus.loading));
    await Future.delayed(const Duration(seconds: 5));
    try {
      final barang = await BarangService().getBarang();
      emit(state.copyWith(status: BarangStatus.loaded, barang: barang.data));
    } catch (e) {
      emit(state.copyWith(
          status: BarangStatus.error, errorMessage: e.toString()));
    }
  }

  void tambahKuantitas(TambahKuantitasEvent event, Emitter emit) {
    List<DataBarang> updatedBarang = [
      for (final barang in state.barang)
        if (barang.idBarang == event.id)
          barang.copyWith(kuantitas: (barang.kuantitas ?? 0) + 1)
        else
          barang
    ];

    emit(state.copyWith(status: BarangStatus.loaded, barang: updatedBarang));
  }

  void kurangiKuantitas(KurangiKuantitasEvent event, Emitter emit) {
    List<DataBarang> updatedBarang = [
      for (final barang in state.barang)
        if (barang.idBarang == event.id)
          barang.copyWith(kuantitas: (barang.kuantitas ?? 0) - 1)
        else
          barang
    ];

    emit(state.copyWith(status: BarangStatus.loaded, barang: updatedBarang));
  }

  void resetStok(ResetStokEvent event, Emitter emit) {
    List<DataBarang> updatedBarang = state.barang
        .map((e) => e.kuantitas! > e.stokBarang
            ? e.copyWith(stokBarang: e.stokBarang)
            : e.copyWith(stokBarang: e.stokBarang - (e.kuantitas ?? 0)))
        .toList();
    emit(state.copyWith(status: BarangStatus.loaded, barang: updatedBarang));
  }
}
