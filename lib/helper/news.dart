import 'dart:convert';
import 'package:flutter_app/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b0a78c0917014f08abb18155923d3623";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            content: element['content'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=b0a78c0917014f08abb18155923d3623";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            content: element['content'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
