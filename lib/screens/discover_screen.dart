import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = "/discover";

  get article => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavBar(index: 1),
      body: ListView(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 5),
              Text("News from all over the world",
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Seach",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icon(
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
