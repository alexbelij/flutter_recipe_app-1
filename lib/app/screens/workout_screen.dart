import 'package:complex_ui/models/upper_workout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text(
                  '${DateFormat('EEEE').format(today)}, ${DateFormat('d MMMM').format(today)}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'UPPER BODY',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.white38,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '60 mins',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.shutter_speed,
                          color: Colors.white38,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Easy',
                          style: TextStyle(
                            color: Colors.white70,
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
              for (var i = 0; i < upperBody.length; i++)
                Column(
                  children: <Widget>[
                    for (var j = 0; j < upperBody[i].length; j++)
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(20),
                            ),
                            color: const Color(0xFF584D9D),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              upperBody[i][j].imagePath,
                              width: 45.0,
                              height: 45.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          upperBody[i][j].name,
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    SizedBox(height: 30.0),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
