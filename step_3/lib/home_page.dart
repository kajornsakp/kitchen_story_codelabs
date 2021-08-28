import 'package:flutter/material.dart';
import 'package:kitchen_story/api.dart';
import 'package:kitchen_story/category_card.dart';
import 'package:kitchen_story/constants.dart';
import 'package:kitchen_story/models.dart';
import 'package:kitchen_story/recommendation_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key? key,
      required this.title,
      required this.recipes,
      required this.onTapped})
      : super(key: key);

  final String title;
  final List<RecipeModel> recipes;
  final ValueChanged<RecipeModel> onTapped;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  KitchenService _kitchenService = KitchenService();

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
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: widget.recipes
                            .map((e) => RecommendationCard(
                                  model: e,
                                  onTapped: () => widget.onTapped(e),
                                ))
                            .toList(),
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
                      child: FutureBuilder(
                        future: _kitchenService.loadCategories(),
                        builder: (BuildContext context,
                            AsyncSnapshot<Categories> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            if (snapshot.hasError) {
                              return Text("Error");
                            } else {
                              return Column(
                                children: snapshot.data?.categories
                                        .map((e) => CategoryCard(model: e))
                                        .toList() ??
                                    [],
                              );
                            }
                          }
                        },
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
