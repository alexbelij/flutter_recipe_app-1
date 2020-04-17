import 'package:animations/animations.dart';
import 'package:complex_ui/app/screens/meal_detail_screen.dart';
import 'package:complex_ui/app/screens/workout_screen.dart';
import 'package:complex_ui/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ProfileScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          iconSize: 40.0,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsetsDirectional.only(top: 5.0),
                child: Icon(Icons.home),
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsetsDirectional.only(top: 5.0),
                child: Icon(Icons.search),
              ),
              title: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsetsDirectional.only(top: 5.0),
                child: Icon(Icons.person),
              ),
              title: Text(
                'People',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE9E9E9),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.35,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40.0),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: 17.0,
                  left: 22.0,
                  right: 10.0,
                  bottom: 4.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '${DateFormat('EEEE').format(today)}, ${DateFormat('d MMMM').format(today)}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                      subtitle: Text(
                        'Hello, David',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(
                        child: Image.asset('assets/user.jpg'),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width: width * 0.35,
                          height: width * 0.35,
                          progress: 0.7,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _IngredientProgress(
                              ingredient: 'Protien',
                              progress: 0.7,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * 0.3,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            _IngredientProgress(
                              ingredient: 'Carbs',
                              progress: 0.5,
                              progressColor: Colors.red,
                              leftAmount: 99,
                              width: width * 0.3,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            _IngredientProgress(
                              ingredient: 'Fat',
                              progress: 0.3,
                              progressColor: Colors.yellow,
                              leftAmount: 61,
                              width: width * 0.3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.51,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32.0,
                      right: 16.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      'MEALS FOR TODAY',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32.0,
                          ),
                          for (var i = 0; i < meals.length; i++)
                            _MealCard(
                              meal: meals[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 1000),
                      closedColor: const Color(0xFFE9E9E9),
                      openBuilder: (context, _) {
                        return WorkoutScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 10.0,
                              left: 32.0,
                              right: 32.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(30.0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF200088),
                                  const Color(0xFF200087),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    left: 16,
                                  ),
                                  child: Text(
                                    'YOUR NEXT WORKOUT',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, left: 16.0),
                                  child: Text(
                                    'UPPER BODY',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: const Color(0xFF584D9D),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            'assets/chest.png',
                                            width: 40.0,
                                            height: 40.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              const BorderRadiusDirectional.all(
                                            Radius.circular(25),
                                          ),
                                          color: const Color(0xFF584D9D),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            'assets/back.png',
                                            width: 40.0,
                                            height: 40.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: const Color(0xFF584D9D),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            'assets/biceps.png',
                                            width: 40.0,
                                            height: 40.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.progressColor,
      this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
                Container(
                  height: 10.0,
                  width: width * progress,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 8.0,
            ),
            Text('${leftAmount}g left')
          ],
        )
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double width, height, progress;

  const _RadialProgress({Key key, this.width, this.height, this.progress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.75),
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '1731',
                  style: const TextStyle(
                    color: const Color(0xFF200087),
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'kcal left',
                  style: const TextStyle(
                    color: const Color(0xFF200087),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
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

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key key, @required this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 20.0,
        bottom: 10.0,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                transitionDuration: const Duration(milliseconds: 1000),
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(20.0),
                  ),
                ),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${meal.kiloCaloriesBurnt} kcal',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 11.0,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '${meal.timeTaken} kcal',
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
