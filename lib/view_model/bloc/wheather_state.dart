part of 'wheather_bloc.dart';

@immutable
class WheatherState extends Equatable {
  final ActionStatus status;
  final String error;
  final List<Articles> news;
  final WheaterModel? wheaterModel;

  const WheatherState(
      {this.status = ActionStatus.isInitial,
      this.error = '',
      this.news = const [],
      this.wheaterModel});

  WheatherState copyWith({
    List<Articles>? news,
    String? error,
    ActionStatus? status,
    WheaterModel? wheaterModel,
  }) {
    return WheatherState(
      error: error ?? this.error,
      status: status ?? this.status,
      news: news ?? this.news,
      wheaterModel: wheaterModel ?? this.wheaterModel,
    );
  }

  @override
  List<Object?> get props => [status, error, news, wheaterModel];
}
