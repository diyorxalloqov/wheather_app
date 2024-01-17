import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/utils/extension.dart';
import 'package:wheather_news_app/utils/status.dart';
import 'package:wheather_news_app/view/widget/shimmers/detail_page_shimmer.dart';
import 'package:wheather_news_app/view/widget/weather_info_screen.dart';
import 'package:wheather_news_app/view_model/bloc/wheather/wheather_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<WheatherBloc>().add(const WheatherHDForecast());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WheatherBloc, WheatherState>(
      builder: (context, state) {
        if (state.status == ActionStatus.isLoading) {
          return const DetailPageShimmer();
        } else if (state.status == ActionStatus.isError) {
          return Center(child: Text(state.error));
        } else if (state.status == ActionStatus.isSuccess) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                  right: context.width * 0.03, left: context.width * 0.03),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF2E335A), Color(0xFF1C1B33)])),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      const Text(
                        "Weather",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.forecastNew?.daily.length,
                    itemBuilder: (context, index) {
                      return WheatherInfoScreen(
                          daily: state.forecastNew!.daily[index]);
                    },
                  ))
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink(
            child: Text("Error"),
          );
        }
      },
    ));
  }
}
