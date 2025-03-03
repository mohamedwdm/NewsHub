import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_webview.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsWebView(
                  articleModel: article,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey, // Border color
            width: 0.2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 0.5, // Spread of shadow
              blurRadius: 3, // Blur effect
              offset: Offset(3, 3), // Position of shadow (X, Y)
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                article.image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // If the image fails to load, show a default image
                  return Image.asset(
                    'assets/no_image.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                article.title,
                textDirection: TextDirection.rtl,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                article.subtitle ?? "",
                textDirection: TextDirection.rtl,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  //fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Divider(
            //   color: Colors.grey,
            //   thickness: 1,
            // ),
          ],
        ),
      ),
    );
  }
}
