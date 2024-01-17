import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wheather_news_app/utils/extension.dart';

class DetailPageShimmer extends StatefulWidget {
  const DetailPageShimmer({Key? key}) : super(key: key);

  @override
  State<DetailPageShimmer> createState() => _SearchPageShimmerState();
}

class _SearchPageShimmerState extends State<DetailPageShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.03, vertical: context.width * 0.09),
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF2E335A), Color(0xFF1C1B33)])),
      child: Column(
        children: [
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: context.width * 0.1),
                height: context.width * 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/rectangle.png'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                        left: 12,
                        top: 20,
                        child: Shimmer.fromColors(
                            baseColor: Colors.white70,
                            highlightColor: Colors.white,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                            ))),
                    Positioned(
                        right: 0,
                        child: Shimmer.fromColors(
                            baseColor: Colors.white70,
                            highlightColor: Colors.white,
                            child: Container(
                              width: 100.2,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50)),
                            ))),
                    Positioned(
                        top: 100,
                        left: 12,
                        child: Shimmer.fromColors(
                            baseColor: Colors.white70,
                            highlightColor: Colors.white,
                            child: Container(
                              width: 120,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                            ))),
                    Positioned(
                        bottom: 24,
                        left: 12,
                        child: Shimmer.fromColors(
                            baseColor: Colors.white70,
                            highlightColor: Colors.white,
                            child: Container(
                              width: 150,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                            ))),
                    Positioned(
                        bottom: 24,
                        right: 20,
                        child: Shimmer.fromColors(
                            baseColor: Colors.white70,
                            highlightColor: Colors.white,
                            child: Container(
                              width: 80,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                            )))
                  ],
                ),
              );
            },
          ))
        ],
      ),
    ));
  }
}
