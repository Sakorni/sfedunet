import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'register_form.dart';
import 'books_page.dart';
import 'films_page.dart';
import 'search_page.dart';
import 'login_form.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _page = 3;
  PageController _controller;
  @override
  void initState(){
    _controller = new PageController(
      initialPage: _page,
    );
    super.initState();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        controller: _controller,
        onPageChanged: (newPage){
          setState(() {
            this._page = newPage;
          });
        },
        children: <Widget>[
          Books(), // Books page
          Films(), // Films page
          Search(),// Search page
          LoginPage(),// Login page
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          //sets the background color of the `BottomNavigationBar
          canvasColor: Colors.blueGrey[800],
        ),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey[900],
          currentIndex: _page, // This will be set when a new tab is tapped
          onTap: (index){
            this._controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.book, color: Colors.blueGrey[300],),
              title: new Text('Книги', style: TextStyle(color: Colors.blueGrey[300]),),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.film, color: Colors.blueGrey[300]),
              title: new Text('Фильмы', style: TextStyle(color: Colors.blueGrey[300]),),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.search, color: Colors.blueGrey[300],),
              title: new Text('Найти', style: TextStyle(color: Colors.blueGrey[300]),),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.person_outline, color: Colors.blueGrey[300],),
              title: Text('Профиль', style: TextStyle(color: Colors.blueGrey[300]),),
            ),
          ]
        ),
      ),
    );
  }
}


// [
//           new BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.book, color: Colors.blueGrey[100],),
//             title: Text('Книги', style: TextStyle(color: Colors.blueGrey[100]),),
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.film, color: Colors.blueGrey[100]),
//             title: Text('Фильмы', style: TextStyle(color: Colors.blueGrey[100]),),  
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.search, color: Colors.blueGrey[100],),
//             title: Text('Найти', style: TextStyle(color: Colors.blueGrey[100]),),
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline, color: Colors.blueGrey[100],),
//             title: Text('Профиль', style: TextStyle(color: Colors.blueGrey[100]),),
//           ),
//         ]