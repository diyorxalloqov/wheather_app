import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/utils/status.dart';
import 'package:wheather_news_app/view_model/bloc/wheather_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _LocationState();
}

class _LocationState extends State<NewsPage> {
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
        return Column(
          children: [
            
          ],
        );
      } else {
        return const SizedBox.shrink(
          child: Text("Error"),
        );
      }
    });
  }
}
