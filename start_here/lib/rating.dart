import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kitchen_story/constants.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [...buildStars(), SizedBox(width: 4,) ,buildDifficulty(context)],
    );
  }

  List<Widget> buildStars() {
    return List.generate(
        5,
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
    return Text("Hard",
        style: TextStyle(
          color: Colors.green,
        ));
  }
}
