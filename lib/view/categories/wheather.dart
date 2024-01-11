import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/utils/status.dart';
import 'package:wheather_news_app/view_model/bloc/wheather_bloc.dart';

class Wheather extends StatefulWidget {
  const Wheather({super.key});

  @override
  State<Wheather> createState() => _LocationState();
}

class _LocationState extends State<Wheather> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheatherBloc, WheatherState>(builder: (context, state) {
      if (state.status == ActionStatus.isLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state.status == ActionStatus.isError) {
        return Center(
          child: Text(state.error),
        );
      } else if (state.status == ActionStatus.isSuccess) {
        return SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Text(
                state.wheaterModel!.name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.wheaterModel!.main!.temp.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 85,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.white,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    state.wheaterModel!.weather![0].main.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    state.wheaterModel!.weather![0].description.toString(),
                    style: const TextStyle(
                      color: Color(0x99EBEBF5),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Center(
                child: Image.asset("assets/House.png"),
              )
            ],
          ),
        );
      } else {
        return const SizedBox.shrink(
          child: Text("Error"),
        );
      }
    });
  }
}
