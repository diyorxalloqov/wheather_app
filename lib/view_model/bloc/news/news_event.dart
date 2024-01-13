part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsGetEvent extends NewsEvent {
  const NewsGetEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


