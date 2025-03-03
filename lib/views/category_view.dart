import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/theme_provider.dart';
import 'package:news_app/widgets/news_listviewbuilder.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context , listen: false).toggleTheme();
              },
              icon: Icon(
                Provider.of<ThemeProvider>(context, listen: false).icon,
                color: Theme.of(context).appBarTheme.foregroundColor,
              )),
        ],
        elevation: 0,
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(
          category,
          style: TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
            fontSize: 22,
          //  fontFamily: "Pacifico",
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
