import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_news_app/db/DBService.dart';
import 'package:wheather_news_app/utils/status.dart';
import 'package:wheather_news_app/view_model/bloc/news/news_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _LocationState();
}

class _LocationState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: RefreshIndicator.adaptive(
        onRefresh: () => DBService().checkNews(),
        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state.status == ActionStatus.isLoading) {
            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white));
          } else if (state.status == ActionStatus.isError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state.status == ActionStatus.isSuccess) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text("News",
                          style: TextStyle(color: Colors.white, fontSize: 30))),
                  Expanded(
                      child: ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(state
                                          .news[index].imageUrl
                                          .toString() ??
                                      'https://www.dutchcowboys.nl/uploads/posts/list/auto-620-c.jpg')),
                              title: Text(
                                state.news[index].title.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }))
                ],
              ),
            );
          } else {
            return const SizedBox.shrink(
              child: Text("Error"),
            );
          }
        }),
      ),
    );
  }
}
