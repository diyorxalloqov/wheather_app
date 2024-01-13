part of 'news_bloc.dart';

@immutable
class NewsState extends Equatable {
  final ActionStatus status;
  final String error;
  final List<Data> news;

  const NewsState({
    this.status = ActionStatus.isInitial,
    this.error = '',
    this.news = const [],
  });

  NewsState copyWith({
    List<Data>? news,
    String? error,
    ActionStatus? status,
  }) {
    return NewsState(
      error: error ?? this.error,
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  List<Object?> get props => [status, error, news];
}
