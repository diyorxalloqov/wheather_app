import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/model/news_model.dart';
import 'package:wheather_news_app/model/wheather_model.dart';
import 'package:wheather_news_app/service/wheather_service.dart';
import 'package:wheather_news_app/utils/status.dart';

part 'wheather_event.dart';
part 'wheather_state.dart';

class WheatherBloc extends Bloc<WheatherEvent, WheatherState> {
  WheatherService wheatherService = WheatherService();
  WheatherBloc() : super(WheatherState()) {
    on<WheaterGetEvent>(_getData);
    add(const WheaterGetEvent());
  }

  FutureOr<void> _getData(
      WheaterGetEvent event, Emitter<WheatherState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    Either<String, WheaterModel> response = await wheatherService.getWheathers();
    response.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) => emit(
            state.copyWith(status: ActionStatus.isSuccess, wheaterModel: r)));
  }
}
