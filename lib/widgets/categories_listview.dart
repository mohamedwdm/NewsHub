import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/Category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const[
   CategoryModel(categoryname: "General", imageurl: "assets/general.avif"),
   CategoryModel(categoryname: "Sports", imageurl: "assets/sports.avif"),
   CategoryModel(categoryname: "Entertainment", imageurl: "assets/entertaiment.avif"),
   CategoryModel(categoryname: "Health", imageurl: "assets/health.avif"),
   CategoryModel(categoryname: "Science", imageurl: "assets/science.avif"),
   CategoryModel(categoryname: "Technology", imageurl: "assets/technology.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(categorymodel: categories[index]);
          }),
    );
  }
}
