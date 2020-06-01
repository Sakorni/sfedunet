import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/pages/books_page.dart';
import 'package:less_projects/UI/pages/films_page.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _page = 1;
  PageController _controller;
  @override
  void initState() {
    _controller = new PageController(
      initialPage: _page,
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        controller: _controller,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: <Widget>[
          Books(), // Books page
          Films(), // Films page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _page, // This will be set when a new tab is tapped
          onTap: (index) {
            this._controller.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(
                FontAwesomeIcons.book,
                // color: Colors.blueGrey[300],
              ),
              title: new Text(
                'Книги',
                style: TextStyle(
                    color: Colors.blueGrey[300], fontWeight: FontWeight.bold),
              ),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                FontAwesomeIcons.film, //color: Colors.blueGrey[300]
              ),
              title: new Text(
                'Фильмы',
                style: TextStyle(
                    color: Colors.blueGrey[300], fontWeight: FontWeight.bold),
              ),
            ),
          ]),
    );
  }
}
