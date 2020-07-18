import 'package:flutter/material.dart';

class NDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'SAROJ DANCE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple[900],
            ),
          )
        ],
      ),
    );
  }
}
