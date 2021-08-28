import 'package:flutter/material.dart';
import 'package:kitchen_story/constants.dart';
import 'package:kitchen_story/models.dart';
import 'package:kitchen_story/rating.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.model
  }) : super(key: key);

  final RecipeModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 28, bottom: 16),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 24,
                offset: Offset(0, 16), // changes position of shadow
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.network(model.imgUrl),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Rating(model: model.rating),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        model.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            ICON_CLOCK,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("${model.totalCookingTime} mins"),
                          SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            ICON_CHEF,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(model.chefName),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 52,
                        width: double.infinity,
                        child: TextButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(26))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFD90000))),
                            onPressed: () {},
                            child: Text("Let's cook")),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
