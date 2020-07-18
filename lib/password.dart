import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  String what;
  String exmpl;
  var ic;
  TextEditingController cont;
  Password(this.what, this.exmpl, this.cont, this.ic);
  @override
  _TextEditorState createState() => _TextEditorState(what, exmpl, cont, ic);
}

var passwordVisible = true;

class _TextEditorState extends State<Password> {
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
          obscureText: passwordVisible,
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
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
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
