import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late BannerAd banner;
  bool isLoading = false;
  String adUnit = "ca-app-pub-3940256099942544/6300978111";

  @override
  void initState() {
    bannerAd();
    super.initState();
  }

  bannerAd() {
    banner = BannerAd(
      adUnitId: adUnit,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('${ad.runtimeType} loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) =>
            print('${ad.runtimeType} failed to load: $error'),
        onAdOpened: (Ad ad) => print('${ad.runtimeType} opened.'),
        onAdClosed: (Ad ad) {
          print('${ad.runtimeType} closed');
          ad.dispose();
          bannerAd();
          print('${ad.runtimeType} reloaded');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    banner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return banner != null
        ? SizedBox(
            height: banner.size.height.toDouble(),
            width: banner.size.width.toDouble(),
            child: AdWidget(ad: banner),
          )
        : const SizedBox.shrink();
  }
}
