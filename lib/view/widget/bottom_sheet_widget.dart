import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/utils/extension.dart';
import 'package:wheather_news_app/utils/status.dart';
import 'package:wheather_news_app/view/widget/shimmers/home_page_shimmer.dart';
import 'package:wheather_news_app/view/widget/weather_info_widget.dart';
import 'package:wheather_news_app/view_model/bloc/wheather/wheather_bloc.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  void initState() {
    context.read<WheatherBloc>().add(const WheatherHDForecast());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheatherBloc, WheatherState>(
      builder: (context, state) {
        if (state.status == ActionStatus.isLoading) {
          return const HomePageShimmer();
        } else if (state.status == ActionStatus.isError) {
          return Center(child: Text(state.error));
        } else {
          return Container(
            height: context.height * 0.35,
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color(0xFFE0D9FF).withOpacity(0.9)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xFF2E335A).withOpacity(0.9),
                      const Color(0xFF1C1B33).withOpacity(0.9),
                      const Color(0xFF612FAB).withOpacity(0.5)
                    ])),
            child: Column(
              children: [
                DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                            indicatorWeight: 1,
                            indicatorColor: Color(0xFF612FAB),
                            labelStyle:
                                TextStyle(fontSize: 16, color: Colors.white),
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                text: "Hourly Forecast",
                              ),
                              Tab(
                                text: "Weekly Forecast",
                              ),
                            ]),
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          child: TabBarView(children: [
                            WheatherInfoPage(
                                data: state.forecastNew!.hourly,
                                isHourly: true),
                            WheatherInfoPage(
                                data: state.forecastNew!.daily, isHourly: false)
                          ]),
                        )
                      ],
                    ))
              ],
            ),
          );
        }
      },
    );
  }
}
