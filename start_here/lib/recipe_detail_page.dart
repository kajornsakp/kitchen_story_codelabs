import 'package:flutter/material.dart';
import 'package:kitchen_story/constants.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
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
                        Image.asset(ICON_HAMBURGER),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "MENU",
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
                                Text("FAVORITED", style: Theme.of(context).textTheme.subtitle2)
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
                                Text("COMMENTED", style: Theme.of(context).textTheme.subtitle2)
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
                                Text("SHARED", style: Theme.of(context).textTheme.subtitle2)
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Rating"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("CHEF"),
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
                    Text("Prepare: 15 min"),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Inactive: 15 min"),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Cook: 20 min"),
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
                    Text("• Ingredient 1"),
                    SizedBox(
                      height: 4,
                    ),
                    Text("• Ingredient 2"),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
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
                    Text("1. Do something"),
                    SizedBox(
                      height: 4,
                    ),
                    Text("2. Do something"),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
