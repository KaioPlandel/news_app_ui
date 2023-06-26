import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/custom_tag.dart';
import 'package:news_app/widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);
  static const routeName = "/article";

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as Article;

    return ImageContainer(
        width: double.infinity,
        imageUrl: article.imageUrl,
        chield: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              _NewsHeadline(
                article: article,
              )
            ],
          ),
        ));
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: Text(
                article.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
