part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchStateLoading extends SearchState{}
class SearchStateLoaded extends SearchState{}
class SearchStateError extends SearchState{}