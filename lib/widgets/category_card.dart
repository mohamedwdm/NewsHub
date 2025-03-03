import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categorymodel,
  });

  final CategoryModel categorymodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryView(category: categorymodel.categoryname,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          alignment: Alignment.center,
          height: 110,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(categorymodel.imageurl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(6),
            color: Colors.cyan,
          ),
          child: Text(
            categorymodel.categoryname,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
