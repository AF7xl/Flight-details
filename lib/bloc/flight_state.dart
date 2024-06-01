part of 'flight_bloc.dart';

@immutable
abstract class FlightState {}

class FlightInitial extends FlightState {}
class FlightStateLoading extends FlightState{}
class FlightStateLoaded extends FlightState{}
class FlightStateError extends FlightState{}