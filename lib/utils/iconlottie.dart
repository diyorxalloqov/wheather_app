import 'package:wheather_news_app/core/assets/lotties.dart';

String getLottie(String name) {
  switch (name) {
    case "01d":
      return Mylottie.d01;
    case "02d":
      return Mylottie.d02;

    case "03d":
      return Mylottie.d03;

    case "04d":
      return Mylottie.d04;

    case "09d":
      return Mylottie.d09;

    case "11d":
      return Mylottie.d11;

    case "13d":
      return Mylottie.d13;

    case "50d":
      return Mylottie.d50;

    case "01n":
      return Mylottie.n01;

    case "02n":
      return Mylottie.n02;

    case "03n":
      return Mylottie.n03;

    case "04n":
      return Mylottie.n04;

    case "09n":
      return Mylottie.n09;

    case "11n":
      return Mylottie.n11;

    case "13n":
      return Mylottie.n13;

    case "50n":
      return Mylottie.n50;

    default:
      return Mylottie.d01;
  }
}
