// https://newsapi.org/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week2/news/news_model.dart';

class NewsService {
  static Future<dynamic>? getNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=4a166e65a8854a5996b5f7893bc1d627&country=us&category=business'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var newResponse = NewsModel.fromJson(json.decode(response.body));
      print(newResponse.articles![0].author);
    }
  }
}
