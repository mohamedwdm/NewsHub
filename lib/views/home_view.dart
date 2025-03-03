import 'package:flutter/material.dart';
import 'package:news_app/services/theme_provider.dart';
import 'package:news_app/widgets/categories_listview.dart';
import 'package:news_app/widgets/news_listviewbuilder.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            
            onPressed: () {
              Provider.of<ThemeProvider>(context , listen: false).toggleTheme(); // Call the toggle function
            },
            icon: Icon(
              Provider.of<ThemeProvider>(context , listen: false).icon, // Use the icon from provider
              color: Theme.of(context).appBarTheme.foregroundColor,
             
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
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
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}
