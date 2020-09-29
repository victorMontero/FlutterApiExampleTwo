import 'package:api_example_two/model/news.dart';

class NewsResponse {
  final List<News> results;
  final String error;

  NewsResponse(this.results, this.error);

  NewsResponse.fromJson(Map<String, dynamic> json)
      : results =
            (json["results"] as List).map((i) => new News.fromJson(i)).toList(),
        error = "";

  NewsResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
