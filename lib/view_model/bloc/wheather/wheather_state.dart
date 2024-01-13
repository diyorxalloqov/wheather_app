part of 'wheather_bloc.dart';

@immutable
class WheatherState extends Equatable {
  final ActionStatus status;
  final String error;
  final WheaterModel? wheaterModel;

  const WheatherState(
      {this.status = ActionStatus.isInitial,
      this.error = '',
      this.wheaterModel});

  WheatherState copyWith({
    String? error,
    ActionStatus? status,
    WheaterModel? wheaterModel,
  }) {
    return WheatherState(
      error: error ?? this.error,
      status: status ?? this.status,
      wheaterModel: wheaterModel ?? this.wheaterModel,
    );
  }

  @override
  List<Object?> get props => [status, error, wheaterModel];
}
