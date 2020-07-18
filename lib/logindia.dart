import 'username.dart';
import 'password.dart';
import 'regform.dart';
import 'loginmess.dart';
import 'package:flutter/material.dart';

TextEditingController uc = new TextEditingController();
TextEditingController pc = new TextEditingController();

showTheDialog(BuildContext context) {
  Dialog dialog = Dialog(
    backgroundColor: Colors.white,
    child: Container(
      //color: Colors.lightBlueAccent,
      width: 20.0,
      height: 290.0,
      child: Column(
        children: [
          Container(
            //width: 240.0,
            height: 30.0,
            alignment: Alignment.center,
            color: Colors.deepPurple[900],
            child: Text(
              'LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      // height: 88,
                      width: 200,
                      child: userEditor('Enter username', 'Paras1419', uc, " "),
                    ),
                    Container(
                      // height: 88,
                      padding: EdgeInsets.all(6),
                      width: 200,
                      child:
                          Password('Enter Password', 'example: *****', pc, ' '),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 55,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "FORGOT PASSWORD",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red[400],
                      ),
                    ),
                    Container(
                      height: 35,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showTheMessDialog(context, uc, pc);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => StudView()));\
                        },
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.deepPurple[900],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      //height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegForm()));
                        },
                        child: Text(
                          "REGISTER HERE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}
