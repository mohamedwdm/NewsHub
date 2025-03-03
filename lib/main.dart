import 'package:flutter/material.dart';
import 'package:news_app/services/theme_provider.dart';
import 'package:news_app/views/home_view.dart';
import 'package:provider/provider.dart';
//import 'package:news_app/services/news_services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create:(context) =>ThemeProvider() ,
    child: NewsApp(),
    ),
        
    );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,

      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
