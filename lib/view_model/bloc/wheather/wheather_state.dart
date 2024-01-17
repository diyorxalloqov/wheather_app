part of 'wheather_bloc.dart';

@immutable
class WheatherState extends Equatable {
  final ActionStatus status;
  final String error;
  final WheaterModel? wheaterModel;
  final HdForecastNew? forecastNew;
  final double longitude;
  final double latitude;

  const WheatherState(
      {this.status = ActionStatus.isInitial,
      this.error = '',
      this.latitude = 0,
      this.longitude = 0,
      this.wheaterModel,
      this.forecastNew});

  WheatherState copyWith(
      {String? error,
      ActionStatus? status,
      WheaterModel? wheaterModel,
      double? longitude,
      double? latitude,
      HdForecastNew? forecastNew}) {
    return WheatherState(
        error: error ?? this.error,
        status: status ?? this.status,
        wheaterModel: wheaterModel ?? this.wheaterModel,
        forecastNew: forecastNew ?? this.forecastNew,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }

  @override
  List<Object?> get props =>
      [status, error, wheaterModel, forecastNew, latitude, longitude];
}
