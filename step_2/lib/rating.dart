import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kitchen_story/constants.dart';
import 'package:kitchen_story/models.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
    required this.model
  }) : super(key: key);

  final RatingModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [...buildStars(), SizedBox(width: 4,) ,buildDifficulty(context)],
    );
  }

  List<Widget> buildStars() {
    return List.generate(
        model.rating,
        (index) => Padding(
              padding: EdgeInsets.only(right: 2),
              child: Image.asset(
                ICON_STAR,
                width: 12,
                height: 12,
              ),
            ));
  }

  Widget buildDifficulty(BuildContext context) {
    return Text(model.difficulty,
        style: TextStyle(
          color: Color(int.parse(model.color)),
        ));
  }
}
