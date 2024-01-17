import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:wheather_news_app/db/DBService.dart';
import 'package:wheather_news_app/model/hd_forecast_model.dart';
import 'package:wheather_news_app/model/wheather_model.dart';
import 'package:wheather_news_app/service/wheather_service.dart';
import 'package:wheather_news_app/utils/status.dart';

part 'wheather_event.dart';
part 'wheather_state.dart';

class WheatherBloc extends Bloc<WheatherEvent, WheatherState> {
  DBService db = DBService();
  final WheatherService _wheatherService = WheatherService();

  WheatherBloc() : super(const WheatherState()) {
    on<WheatherGetLocation>(_getLocation);
    add(WheatherGetLocation());
    on<WheaterGetEvent>(_getData);
    add(const WheaterGetEvent());
    on<WheatherHDForecast>(_getWheatherHD);
  }

  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  FutureOr<void> _getData(
      WheaterGetEvent event, Emitter<WheatherState> emit) async {
    try {
      var response = await db.getWheather();

      if (response is WheaterModel) {
        emit(state.copyWith(
            status: ActionStatus.isSuccess, wheaterModel: response));
      } else {
        emit(state.copyWith(status: ActionStatus.isError, error: 'Xatolik'));
      }
    } catch (e) {
      print('Error fetching data: $e');
      emit(state.copyWith(status: ActionStatus.isError, error: 'Xatolik'));
    }
  }

  FutureOr<void> _getWheatherHD(
      WheatherHDForecast event, Emitter<WheatherState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    var res =
        await _wheatherService.getHDForecast(state.longitude, state.latitude);
    if (res is HdForecastNew) {
      emit(state.copyWith(status: ActionStatus.isSuccess, forecastNew: res));
    } else {
      emit(state.copyWith(status: ActionStatus.isError, error: res));
    }
  }

  FutureOr<void> _getLocation(
      WheatherGetLocation event, Emitter<WheatherState> emit) async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        emit(state.copyWith(
            latitude: _locationData.latitude,
            longitude: _locationData.longitude));
      }
    }

    _locationData = await location.getLocation();
  }
}
