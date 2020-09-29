import 'package:api_example_two/model/news_response.dart';
import 'package:api_example_two/repository/news_api_provider.dart';

class NewsRepository{
  NewsApiProvider _apiProvider = NewsApiProvider();

  Future<NewsResponse> getNews(){
    return _apiProvider.getNews();
  }
}