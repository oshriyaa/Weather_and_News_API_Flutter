import 'package:flutter/material.dart';
import 'package:week2/news/news_service.dart';

class NewsInterface extends StatefulWidget {
  const NewsInterface({super.key});

  @override
  State<NewsInterface> createState() => _NewsInterfaceState();
}

class _NewsInterfaceState extends State<NewsInterface> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
              onPressed: () {
                NewsService.getNews();
              },
              child: const Text("Press")),
        ),
      ),
    );
  }
}
