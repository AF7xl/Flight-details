import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flightdetails/repository/ModelClass/FlightModelClass.dart';
import 'package:flightdetails/repository/api/searchapi.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late FlightModelClass flightModelClass;
  Searchapi searchapi = Searchapi();

  SearchBloc() : super(SearchInitial()) {
    on<FetchSearch>((event, emit) async {
      emit(SearchStateLoading());
      try {
        flightModelClass = await searchapi.getSearch(event.search);
        emit(SearchStateLoading());
      } catch (e) {
        print(e);
        emit(SearchStateError());
      }});
  }
}
