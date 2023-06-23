import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/widgets/custom_tag.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    var article = Article.articles[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavBar(index: 0),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          NewOfTheDay(article: article),
          BreakingNews(articles: Article.articles)
        ],
      ),
    );
  }
}

class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Breaking News",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text("More",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {Navigator.pushNamed(context, ArticleScreen.routeName, arguments: articles[index]);},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.5,
                          imageUrl: articles[index].imageUrl,
                          chield: Container(),
                        ),
                        SizedBox(height: 10),
                        Text(
                          articles[index].title,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "By ${articles[index].author}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),
                        Text(
                          "${DateTime.now().difference(articles[index].createdAt).inHours} Hours ago",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class NewOfTheDay extends StatelessWidget {
  const NewOfTheDay({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      imageUrl: article.imageUrl,
      chield: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                "News of the day",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(
                children: [
                  Text(
                    "Learn More",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
