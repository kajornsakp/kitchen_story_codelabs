import 'package:flutter/material.dart';
import 'package:kitchen_story/constants.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
  }) : super(key: key);

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
                  child: Image.asset(ICON_HAMBURGER),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: List.generate(
                            5,
                            (index) => Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Image.asset(
                                    ICON_STAR,
                                    width: 12,
                                    height: 12,
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "NAME",
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
                          Text("TIME"),
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
                          Text("NAME"),
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