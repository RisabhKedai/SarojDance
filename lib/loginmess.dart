import 'dart:async';
import 'pageviewholder.dart';
import 'package:flutter/material.dart';
import 'checklogin.dart';

showTheMessDialog(
    BuildContext context, TextEditingController un, TextEditingController ps) {
  Dialog dialog = Dialog(
    backgroundColor: Colors.white,
    child: Container(
      //color: Colors.lightBlueAccent,
      width: 20.0,
      height: 190.0,
      child: FutureBuilder(
        future: checkUser(un, ps, context),
        builder: (context, logmess) {
          if (logmess.hasData) {
            if (logmess.data == 'non') {
              return Column(
                children: <Widget>[
                  Icon(
                    Icons.sms_failed,
                    size: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'Failed to login. Check internet connection',
                      style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            } else if (logmess.data) {
              Timer(
                Duration(seconds: 2),
                () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageViewHolder()));
                },
              );
              return Column(
                children: <Widget>[
                  Icon(
                    Icons.done,
                    size: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'You are logged in successfully',
                      style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: <Widget>[
                  Icon(
                    Icons.sms_failed,
                    size: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'Failed to login. Check un or ps. or designation',
                      style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}
