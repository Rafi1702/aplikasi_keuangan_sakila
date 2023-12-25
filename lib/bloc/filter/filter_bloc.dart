import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sakila_store_project/model/filter_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<GetFilterEvent>(getFilter);
    on<ChangeFilterEvent>(changeFilter);
  }
  void changeFilter(ChangeFilterEvent event, Emitter emit) {
    final currentState = state;
    if (currentState is FilterLoaded) {
      List<Filter> updatedStatus = [
        for (final filters in currentState.filters)
          if (filters.id == event.filter.id)
            filters.copyWith(isActive: true)
          else
            filters.copyWith(isActive: false)
      ];

      emit(FilterLoaded(filters: updatedStatus));
    }
  }

  void getFilter(GetFilterEvent event, Emitter emit) {
    emit(const FilterLoaded(
      filters: [
        Filter(id: 1, nama: 'Pemasukan', isActive: true),
        Filter(id: 2, nama: 'Pengeluaran', isActive: false),
      ],
    ));
  }
}
