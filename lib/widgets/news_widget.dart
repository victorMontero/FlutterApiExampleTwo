import 'package:api_example_two/bloc/news_bloc.dart';
import 'package:api_example_two/model/news.dart';
import 'package:api_example_two/model/news_response.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    super.initState();
    bloc.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildNewsWidget(snapshot.data);
        } else if (snapshot.error) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildingLoadingWidget();
        }
      },
    );
  }

  Widget _buildingLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "loading news ...",
            style: Theme.of(context).textTheme.subtitle,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "error occurred: $error",
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsWidget(NewsResponse data) {
    News news = data.results[0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage("https://randomuser.me/api/portraits/thumb/men/1.jpg"),
          ),
          Text("${_capitalizeFirstLetter(news.user.name)}",
              style: Theme.of(context).textTheme.subtitle),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(news.message.content, style: Theme.of(context).textTheme.body1),
        ],
      ),
    );
  }

  _capitalizeFirstLetter(String text) {
    return text.substring(0, 1).toUpperCase() + text.substring(0, text.length);
  }
}
