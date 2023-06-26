import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/widgets/image_container.dart';

import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = "/discover";

  get article => null;

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ["Health", "Politics", "Art", "Food", "Science"];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          children: [
            _DiscoverNews(),
            _CategaoriesNews(
              categories: tabs,
            )
          ],
        ),
      ),
    );
  }
}

class _CategaoriesNews extends StatelessWidget {
  const _CategaoriesNews({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;

    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: categories
              .map((tab) =>
              Tab(
                  icon: Text(
                    tab,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )))
              .toList(),
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: TabBarView(
            children: [
              categories
                  .map(
                    (tab) =>
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ArticleScreen.routeName,
                                arguments: articles[index]);
                          },
                          child: Row(
                            children: [
                              ImageContainer(
                                width: 80,
                                height: 80,
                                imageUrl: articles[index].imageUrl,
                                chield: Container(),
                                margin: EdgeInsets.all(10),
                                borderRadius: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(Icons.schedule, size: 18),
                                        SizedBox(width: 5),
                                        Text(
                                            "${DateTime
                                                .now()
                                                .difference(
                                                articles[index].createdAt)
                                                .inHours} hours ago",
                                            style: TextStyle(fontSize: 12)),
                                        SizedBox(width: 20),
                                        Icon(Icons.visibility, size: 18),
                                        SizedBox(width: 5),
                                        Text("${articles[index].views} views ",
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
              )
                  .toList()
            ],
          ),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Discover",
            style: Theme
                .of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text("News from all over the world",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                hintText: "Seach",
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffix: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}
