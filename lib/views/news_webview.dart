import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:news_app/models/article_model.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({super.key, required this.articleModel});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
  final ArticleModel articleModel;
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.articleModel.newsUrl),
      );
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              icon: Icon(
                Provider.of<ThemeProvider>(context, listen: false).icon,
                color: Theme.of(context).appBarTheme.foregroundColor,
              )),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor,
                  fontSize: 22,
                  fontFamily: "Pacifico",
                ),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.orange, fontSize: 22, fontFamily: "Pacifico"),
              ),
              Padding(
                // for center the title correctly
                padding: EdgeInsets.only(left: 48.0),
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.orange,
            ))
          : WebViewWidget(controller: controller),
    );
  }
}
