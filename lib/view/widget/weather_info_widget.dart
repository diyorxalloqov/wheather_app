import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:wheather_news_app/utils/extension.dart';
import 'package:wheather_news_app/utils/iconlottie.dart';

class WheatherInfoPage extends StatelessWidget {
  final bool isHourly;
  final List data;
  const WheatherInfoPage(
      {super.key, required this.isHourly, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      width: context.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: context.width * 0.17,
            height: context.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                color: const Color(0xFF48319D).withOpacity(0.2),
                border: Border.all(color: const Color(0xFFE0D9FF))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isHourly
                    ? Text(
                        DateFormat.j().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                data[index].dt * 1000)),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      )
                    : Text(
                        DateFormat.E().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                data[index].dt * 1000)),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                SizedBox(
                    width: context.width * 0.13,
                    height: context.width * 0.13,
                    child: Lottie.asset(getLottie(data[index].weather.icon))),
                isHourly
                    ? Text(
                        "${data[index].temp.round()}°",
                        style: const TextStyle(color: Colors.white),
                      )
                    : Text("${data[index].temp.temp.round()}°",
                        style: const TextStyle(color: Colors.white))
              ],
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
