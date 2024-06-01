import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flightdetails/repository/ModelClass/FlightModelClass.dart';
import 'package:flightdetails/repository/api/flightapi.dart';
import 'package:meta/meta.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  late FlightModelClass flightModelClass;
  Flightapi flightapi=Flightapi();
  FlightBloc() : super(FlightInitial()) {
    on<FlightEvent>((event, emit) async {
      emit(FlightStateLoading());
      try{

        flightModelClass= await flightapi.getFlight();
        emit(FlightStateLoaded());
      } catch(e){
        print(e);
        emit(FlightStateError());}

    });
  }
}
