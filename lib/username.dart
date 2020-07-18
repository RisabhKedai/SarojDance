import 'package:flutter/material.dart';

class userEditor extends StatefulWidget {
  String what;
  String exmpl;
  var ic;
  TextEditingController cont;
  userEditor(this.what, this.exmpl, this.cont, this.ic);
  @override
  _TextEditorState createState() => _TextEditorState(what, exmpl, cont, ic);
}

//var passwordVisible=false;

class _TextEditorState extends State<userEditor> {
  String what;
  String exmpl;
  var ic;
  TextEditingController cont;
  _TextEditorState(this.what, this.exmpl, this.cont, this.ic);
  // final TextEditingController _name = new TextEditingController();
  String name = "Hello";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: cont,
          keyboardType: TextInputType.text,
          // onChanged: (value) => {
          //   print(value);
          // },
          onSubmitted: (value) {
            // print(value);
            setState(() {
              name = value;
            });
          },
          //obscureText: passwordVisible,
          decoration: InputDecoration(
            labelText: what,
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
            hintText: exmpl,
            border: UnderlineInputBorder(),
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(150.0, 10, 0, 0),
          child: Text(
            ic,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
