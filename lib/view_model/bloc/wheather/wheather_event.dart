part of 'wheather_bloc.dart';

@immutable
sealed class WheatherEvent extends Equatable {
  const WheatherEvent();
}

class WheaterGetEvent extends WheatherEvent {
  const WheaterGetEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WheatherHDForecast extends WheatherEvent {
  const WheatherHDForecast();
  @override
  List<Object?> get props => [];
}

class WheatherGetLocation extends WheatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
