import 'package:SarojDance/favourites.dart';
import 'package:SarojDance/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'videoscr.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'teachPro.dart';
import 'studView.dart';
import 'drawer.dart';

int bottomSelectedIndex = 0;

List<BottomNavigationBarItem> buildBottomNavBarItems() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('FAVOURITES'),
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.star),
      title: new Text('FEEDBACKS'),
    ),
    BottomNavigationBarItem(
      icon: new Icon(MyFlutterApp.chalkboard_teacher),
      title: new Text('TUTORS'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_call),
      title: Text('TUTORIALS'),
    ),
  ];
}

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

class PageViewHolder extends StatefulWidget {
  PageViewHolder({Key key}) : super(key: key);
  @override
  _PageViewHolder createState() => _PageViewHolder();
}

class _PageViewHolder extends State<PageViewHolder> {
  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    bottomSelectedIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              return _scaffoldKey.currentState.openDrawer();
            },
          ),
        ],
        title: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10.0),
          height: 80,
          child: Text(
            'Welcome to Saroj',
            style: TextStyle(
                fontFamily: 'Orbitron', fontSize: 17, color: Colors.white),
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: <Widget>[
          FavScr(),
          StudView(),
          TeachPro(),
          Vidscr(),
        ],
        scrollDirection: Axis.horizontal,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
