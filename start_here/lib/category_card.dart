import 'package:flutter/material.dart';
import 'package:kitchen_story/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 28, right: 28),
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
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
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Image.asset(
                    ICON_SALAD,
                    width: 48,
                    height: 48,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CATEGORY",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "AMOUNT",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
