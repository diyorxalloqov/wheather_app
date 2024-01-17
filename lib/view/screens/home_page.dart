import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/view/categories/wheather.dart';
import 'package:wheather_news_app/view/screens/detail_page.dart';
import 'package:wheather_news_app/view/widget/ads/banner.dart';
import 'package:wheather_news_app/view/widget/bottom_sheet_widget.dart';
import 'package:wheather_news_app/view_model/bloc/wheather/wheather_bloc.dart';
import '../categories/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  int _currentindex = 0;
  final List _screens = const [Wheather(), NewsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back.png'), fit: BoxFit.cover),
          ),
          child: _screens[_currentindex]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BannerWidget(),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                boxShadow: const [BoxShadow(blurRadius: 25)],
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(58, 58, 106, 0.26),
                  Color.fromRGBO(117, 130, 244, 0.5)
                ])),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromRGBO(37, 36, 76, 0.26),
              selectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    icon: _currentindex == 0
                        ? const Image(
                            image: AssetImage('assets/Symbol.png'),
                          )
                        : const AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: 0.5,
                            child: Image(
                              image: AssetImage('assets/Symbol.png'),
                            ),
                          ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: _currentindex == 1
                        ? const Image(
                            image: AssetImage('assets/menu.png'),
                          )
                        : const AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: 0.5,
                            child: Image(
                              image: AssetImage('assets/menu.png'),
                            ),
                          ),
                    label: ''),
              ],
              currentIndex: _currentindex,
              iconSize: 42,
              onTap: (value) {
                setState(() {
                  _currentindex = value;
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _currentindex == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPage()));
                    },
                    child: const Icon(Icons.menu)),
                const SizedBox(width: 20),
                FloatingActionButton(
                    onPressed: () {
                      context
                          .read<WheatherBloc>()
                          .add(const WheatherHDForecast());
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const BottomSheetWidget());
                    },
                    child: const Icon(Icons.add)),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
