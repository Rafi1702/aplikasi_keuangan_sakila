part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

// final class FilterInitial extends FilterState {}

final class FilterInitial extends FilterState {}

final class FilterLoaded extends FilterState {
  final List<Filter> filters;

  const FilterLoaded({required this.filters});
  @override
  List<Object> get props => [filters];
}
