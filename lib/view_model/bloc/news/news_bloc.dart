import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/db/DBService.dart';
import 'package:wheather_news_app/model/news_model.dart';
import 'package:wheather_news_app/utils/status.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  DBService db = DBService();

  NewsBloc() : super(const NewsState()) {
    on<NewsGetEvent>(_getNews);
    add(const NewsGetEvent());
  }

  FutureOr<void> _getNews(NewsGetEvent event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    var news = await db.checkNews();
    if (news is List<Data>) {
      emit(state.copyWith(status: ActionStatus.isSuccess, news: news));
    } else {
      emit(state.copyWith(status: ActionStatus.isError, error: "error"));
    }
  }

}
