part of 'detail_pengeluaran_bloc.dart';

sealed class DetailPengeluaranEvent extends Equatable {
  const DetailPengeluaranEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailPengeluaranEvent extends DetailPengeluaranEvent {
  final int id;
  const GetDetailPengeluaranEvent({required this.id});

  @override
  List<Object> get props => [id];
}
