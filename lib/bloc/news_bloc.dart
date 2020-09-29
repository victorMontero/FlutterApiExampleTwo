import 'package:api_example_two/model/news_response.dart';
import 'package:api_example_two/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NewsResponse> _subject =
      BehaviorSubject <NewsResponse>();

  getNews() async {
    NewsResponse response = await _repository.getNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<NewsResponse> get subject => _subject;
}

final bloc = NewsBloc();
