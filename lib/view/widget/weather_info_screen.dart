// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:wheather_news_app/model/hd_forecast_model.dart';
import 'package:wheather_news_app/utils/iconlottie.dart';

class WheatherInfoScreen extends StatelessWidget {
  final Daily daily;
  const WheatherInfoScreen({super.key, required this.daily});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).width * 0.1),
      height: MediaQuery.sizeOf(context).width * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/rectangle.png'), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            left: 12,
            top: 20,
            child: Text("${daily.temp.temp.toInt()}°",
                style: const TextStyle(color: Colors.white, fontSize: 72)),
          ),
          Positioned(
              right: 0,
              child: Lottie.asset(getLottie(daily.weather.icon),
                  height: MediaQuery.sizeOf(context).width * 0.4)),
          Positioned(
              top: 100,
              left: 20,
              child: Text(
                "H:24  L:18",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 18),
              )),
          Positioned(
            bottom: 24,
            left: 20,
            child: Text(
              daily.weather.main.toString().replaceFirst(RegExp(r'Main.'), ''),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 20,
            child: Text(
                DateFormat.MMMEd().format(DateTime.fromMillisecondsSinceEpoch(
                    (daily.dt * 1000).toInt())),
                style: const TextStyle(fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
