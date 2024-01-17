import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class HomePageShimmer extends StatefulWidget {
  const HomePageShimmer({Key? key}) : super(key: key);

  @override
  State<HomePageShimmer> createState() => _HomePageShimmer();
}

class _HomePageShimmer extends State<HomePageShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer.fromColors(
              baseColor: Colors.white70,
              highlightColor: Colors.white,
              child: Container(height: 12, width: 70, color: Colors.white70)),
          Shimmer.fromColors(
              baseColor: Colors.white70,
              highlightColor: Colors.white,
              child: Container(height: 12, width: 70, color: Colors.white70)),
          Shimmer.fromColors(
              baseColor: Colors.white70,
              highlightColor: Colors.white,
              child: Container(height: 12, width: 70, color: Colors.white70)),
        ],
      ),
    );
  }
}
