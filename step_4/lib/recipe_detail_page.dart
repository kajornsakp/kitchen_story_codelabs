import 'package:flutter/material.dart';
import 'package:kitchen_story/constants.dart';
import 'package:kitchen_story/models.dart';
import 'package:kitchen_story/rating.dart';

class DetailPage extends Page {
  final RecipeModel recipe;

  DetailPage({required this.recipe}) : super(key: ValueKey(recipe));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return RecipeDetailPage(recipe: recipe);
        });
  }
}

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                ICON_FAVORITE,
                height: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                ICON_SHARE,
                height: 24,
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(recipe.imgUrl, height: 200,),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          recipe.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(ICON_FAVORITE,
                                    height: 18,
                                    color: Colors.black.withOpacity(0.5)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("FAVORITED",
                                    style:
                                        Theme.of(context).textTheme.subtitle2)
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Row(
                              children: [
                                Image.asset(ICON_CHAT,
                                    height: 18,
                                    color: Colors.black.withOpacity(0.5)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("COMMENTED",
                                    style:
                                        Theme.of(context).textTheme.subtitle2)
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Row(
                              children: [
                                Image.asset(ICON_SHARE,
                                    height: 18,
                                    color: Colors.black.withOpacity(0.5)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("SHARED",
                                    style:
                                        Theme.of(context).textTheme.subtitle2)
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Rating(model: recipe.rating,),
                        SizedBox(
                          height: 8,
                        ),
                        Text("by ${recipe.chefName}"),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      ICON_CLOCK,
                      height: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Cooking time",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text("Prepare: ${recipe.cookingTime.prepareTime} min"),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Inactive: ${recipe.cookingTime.inactiveTime} min"),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Cook: ${recipe.cookingTime.cookTime} min"),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      ICON_OAT,
                      height: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    ...buildIngredients(),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      ICON_RECIPE,
                      height: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Cooking steps",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    ...buildInstructions(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildIngredients() {
    return recipe.ingredients.map((e) => Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(e),
    )).toList();
  }

  List<Widget> buildInstructions() {
    return recipe.steps.map((e) => Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text("${e.step} ${e.instruction}"),
    )).toList();
  }
}
