import 'package:SarojDance/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
//import 'dart:async';
import 'dart:io';
//import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'logindia.dart';

class LoginWin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: FractionalOffset.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    height: 100,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        final directory =
                            await getApplicationDocumentsDirectory();
                        var path = directory.path;
                        var file = File('$path/tors.txt');
                        file.writeAsString('student');
                        showTheDialog(context);
                      },
                      child: Icon(
                        MyFlutterApp.school,
                        size: 55,
                        color: Colors.deepPurple[900],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Students',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple[900],
                        fontFamily: 'Orbitron',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    height: 100,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        final directory =
                            await getApplicationDocumentsDirectory();
                        var path = directory.path;
                        var file = File('$path/tors.txt');
                        file.writeAsString('teacher');
                        showTheDialog(context);
                      },
                      child: Icon(
                        MyFlutterApp.chalkboard_teacher,
                        size: 55,
                        color: Colors.deepPurple[900],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Tutors',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple[900],
                        fontFamily: 'Orbitron',
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
