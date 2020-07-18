import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  String what;
  String exmpl;
  var icona;
  TextEditingController cont;
  TextEditor(this.what, this.exmpl, this.icona, this.cont);
  @override
  _TextEditorState createState() => _TextEditorState(what, exmpl, icona, cont);
}

class _TextEditorState extends State<TextEditor> {
  String what;
  String exmpl;
  var icona;
  TextEditingController cont;
  _TextEditorState(this.what, this.exmpl, this.icona, this.cont);
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
          decoration: InputDecoration(
            labelText: what,
            hintText: exmpl,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            icon: Icon(icona),
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
        //Text(name)
      ],
    );
  }
}
