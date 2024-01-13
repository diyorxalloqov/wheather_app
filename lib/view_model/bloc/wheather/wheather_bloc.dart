import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/db/DBService.dart';
import 'package:wheather_news_app/model/wheather_model.dart';
import 'package:wheather_news_app/utils/status.dart';

part 'wheather_event.dart';
part 'wheather_state.dart';

class WheatherBloc extends Bloc<WheatherEvent, WheatherState> {
  DBService db = DBService();

  WheatherBloc() : super(const WheatherState()) {
    on<WheaterGetEvent>(_getData);
    add(const WheaterGetEvent());
  }
FutureOr<void> _getData(WheaterGetEvent event, Emitter<WheatherState> emit) async {
  emit(state.copyWith(status: ActionStatus.isLoading));

  try {
    var response = await db.getWheather();
    
    if (response is WheaterModel) {
      emit(state.copyWith(
          status: ActionStatus.isSuccess, wheaterModel: response));
    } else {
      emit(state.copyWith(status: ActionStatus.isError, error: 'Xatolik'));
    }
  } catch (e) {
    // Handle exceptions here
    print('Error fetching data: $e');
    emit(state.copyWith(status: ActionStatus.isError, error: 'Xatolik'));
  }
}

}
