import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final dio = Dio();

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {

      String apiUrl = 'https://gnews.io/api/v4/top-headlines?category=${category.toLowerCase()}&country=eg&apikey=96c0e84647c23e1d83e19da2afd34dc0';
      var response = await dio.get(apiUrl);
      Map<String, dynamic> Jsondata = response.data;
      List<dynamic> articles = Jsondata['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);

        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}


//https://newsdata.io/api/1/latest?apikey=pub_70674d505dac90f909c1dc8567de55405e280&country=eg&category=$category&language=ar
//https://api.worldnewsapi.com/search-news?source-country=eg&categories=other&api-key=1f09df77108b4f72819d1882c676ebe2
//https://gnews.io/api/v4/top-headlines?category=general&country=eg&apikey=96c0e84647c23e1d83e19da2afd34dc0