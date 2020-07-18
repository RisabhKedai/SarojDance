import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUpload createState() => _ImageUpload();
}

class _ImageUpload extends State<ImageUpload> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        _image = File(pickedFile.path);
      },
    );
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: _image == null
                ? Icon(Icons.person, size: 70)
                : CircleAvatar(
                    radius: 75,
                    child: CircleAvatar(
                      backgroundImage: FileImage(_image),
                      // child: ClipOval(child: Image.file(_image)),
                      radius: 70,
                    ),
                  ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(8.0),
            onPressed: getImage,
            // tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }
}
