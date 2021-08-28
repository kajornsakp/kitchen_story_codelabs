import 'package:flutter/material.dart';
import 'package:kitchen_story/category_card.dart';
import 'package:kitchen_story/constants.dart';
import 'package:kitchen_story/recipe_detail_page.dart';
import 'package:kitchen_story/recommendation_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kitchen story'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            buildAppBar(),
            buildSearchBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28, top: 20),
                    child: Text(
                      "Recommendation",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          RecommendationCard(),
                          RecommendationCard(),
                          RecommendationCard(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      "Categories",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          CategoryCard(),
                          CategoryCard(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildAppBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: AppBar(
          backgroundColor: Color(0xFFF8F8F8),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Image.asset(
              ICON_MENU,
              width: 24,
              height: 24,
            ),
          ),
          titleSpacing: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              hoverColor: Colors.grey,
              focusColor: Colors.grey,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              filled: true,
              prefixIcon: Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 8),
                child: Image.asset(
                  ICON_SEARCH,
                  width: 20,
                  height: 20,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              fillColor: Colors.white,
              hintText: "Recipe, Level, Chef Name"),
        ),
      ),
    );
  }
}
