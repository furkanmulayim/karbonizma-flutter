part of 'carbon_bloc.dart';

@immutable
abstract class CarbonEvent {}

//İnitial events
class CarbonInitialEvent extends CarbonEvent {}

class CarbonInitialEventById extends CarbonEvent {}
