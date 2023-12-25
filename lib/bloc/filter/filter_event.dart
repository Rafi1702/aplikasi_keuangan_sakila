part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class GetFilterEvent extends FilterEvent {}

class ChangeFilterEvent extends FilterEvent {
  final Filter filter;

  const ChangeFilterEvent({required this.filter});

  @override
  List<Object> get props => [filter];
}
