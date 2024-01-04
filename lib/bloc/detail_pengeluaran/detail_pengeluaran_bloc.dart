import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_pengeluaran_event.dart';
part 'detail_pengeluaran_state.dart';

class DetailPengeluaranBloc extends Bloc<DetailPengeluaranEvent, DetailPengeluaranState> {
  DetailPengeluaranBloc() : super(DetailPengeluaranInitial()) {
    on<DetailPengeluaranEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
