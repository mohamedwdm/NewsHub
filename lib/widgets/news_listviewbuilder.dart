import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
  final String category;

  const NewsListViewBuilder({super.key, required this.category});
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var futureRequest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureRequest = NewsServices().getNews(category: widget.category);
  }

  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: futureRequest,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text("Oops, there was an error please try later"),
              ),
            );
          } else {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(color: Colors.orange,),
              ),
            );
          }
        });
  }
}
