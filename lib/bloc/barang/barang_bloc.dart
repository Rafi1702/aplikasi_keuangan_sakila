import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/services/barang_service.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  BarangBloc() : super(BarangLoading()) {
    on<GetBarangEvent>(getBarang);
    on<TambahKuantitasEvent>(tambahKuantitas);
    on<KurangiKuantitasEvent>(kurangiKuantitas);
    on<ResetStokEvent>(resetStok);
  }
  void getBarang(GetBarangEvent event, Emitter emit) async {
    emit(BarangLoading());
    try {
      final barang = await BarangService().getBarang();
      emit(BarangLoaded(barang: barang.data));
    } catch (e) {
      emit(BarangError(error: e.toString()));
    }
  }

  void tambahKuantitas(TambahKuantitasEvent event, Emitter emit) {
    final currentState = state;

    if (currentState is BarangLoaded) {
      List<DataBarang> updatedBarang = [
        for (final barang in currentState.barang)
          if (barang.idBarang == event.id)
            barang.copyWith(kuantitas: (barang.kuantitas ?? 0) + 1)
          else
            barang
      ];
      print(updatedBarang[1].kuantitas);

      emit(BarangLoaded(barang: updatedBarang));
    }
  }

  void kurangiKuantitas(KurangiKuantitasEvent event, Emitter emit) {
    final currentState = state;

    if (currentState is BarangLoaded) {
      List<DataBarang> updatedBarang = [
        for (final barang in currentState.barang)
          if (barang.idBarang == event.id)
            barang.copyWith(
                kuantitas: barang.kuantitas! <= 0
                    ? barang.kuantitas
                    : (barang.kuantitas ?? 0) - 1)
          else
            barang
      ];

      emit(BarangLoaded(barang: updatedBarang));
    }
  }

  void resetStok(ResetStokEvent event, Emitter emit) {
    final currentState = state;

    if (currentState is BarangLoaded) {
      List<DataBarang> updatedBarang = currentState.barang
          .map((e) => e.kuantitas! > e.stokBarang
              ? e.copyWith(stokBarang: e.stokBarang)
              : e.copyWith(stokBarang: e.stokBarang - (e.kuantitas ?? 0)))
          .toList();

      emit(BarangLoaded(barang: updatedBarang));
    }
  }
}
