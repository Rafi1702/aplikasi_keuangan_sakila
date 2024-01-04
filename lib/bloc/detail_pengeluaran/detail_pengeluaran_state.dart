part of 'detail_pengeluaran_bloc.dart';

sealed class DetailPengeluaranState extends Equatable {
  const DetailPengeluaranState();
  
  @override
  List<Object> get props => [];
}

final class DetailPengeluaranInitial extends DetailPengeluaranState {}
