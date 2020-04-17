import 'package:complex_ui/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40.0),
                ),
                child: Image.asset(
                  meal.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20.0),
                ListTile(
                  title: Text(
                    meal.mealTime.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  subtitle: Text(
                    meal.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${meal.kiloCaloriesBurnt} kcal',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${meal.timeTaken} mins',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'INGREDIENTS',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var i = 0; i < meal.ingredients.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            meal.ingredients[i],
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'PREPARATION',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 32.0),
                  child: Text(
                    meal.preparation,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
