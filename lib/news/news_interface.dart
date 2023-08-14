import 'package:flutter/material.dart';
import 'package:week2/news/news_service.dart';
import 'package:week2/news/widgets/news_card.dart';

class NewsInterface extends StatefulWidget {
  const NewsInterface({super.key});

  @override
  State<NewsInterface> createState() => _NewsInterfaceState();
}

class _NewsInterfaceState extends State<NewsInterface> {
  Future<dynamic>? newsResp;

  @override
  void initState() {
    newsResp = NewsService.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("News")),
        body: FutureBuilder<dynamic>(
            future: newsResp,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.articles.length,
                        itemBuilder: (context, index) {
                          return CustomNewsCard(
                            title:
                                snapshot.data!.articles[index].title.toString(),
                            author: snapshot.data!.articles[index].author
                                .toString(),
                          );
                        }),
                  ),
                );
              }
              return const Center(child: Text("No data found"));
            }),
      ),
    );
  }
}
