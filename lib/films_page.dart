import 'package:flutter/material.dart';
import 'books_page.dart';

class Films extends StatefulWidget {
  @override
  _FilmsState createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundGradient(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomBunner(),
              FilmListView(
                title: 'Фантастика',
                films: [
                  'nachalo.webp',
                  'ivan_vasilievich.webp',
                  'avatar.webp',
                  'temniy_ricar.webp',
                  'matrix.webp',
                  'strazi_galaktiki.webp',
                  'valee.webp',
                  'back_to_future.webp',
                  'five_elem.webp',
                  'deadpool.webp',
                ],
              ),
              FilmListView(
                title: 'Приключения',
                films: [
                  'piraty_karibskogo_morya.jpg',
                  'ZooTropolis.jpg',
                  'Avengers.webp',
                  'leon_king1.webp',
                  'harry_1.webp',
                  'briliantovaya_ruka.webp',
                  'toy_story1.webp',
                  'sherlok.webp',
                  'fantasticheskiye_tvari_1.webp',
                  'marsianin.webp',
                ],
              ),
              FilmListView(
                title: 'Семейный',
                films: [
                  'odin_doma.webp',
                  'hatico.webp',
                  'golovolomka.webp',
                  'malefisenta.webp',
                  'cars.webp',
                  'chudo.webp',
                  'paddingtons_advanture.webp',
                  'polosatiy_reys.webp',
                  'prizrak.webp',
                  '101_dalmatines.webp',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilmListView extends StatelessWidget {
  final String title;
  final List<String> films;

  const FilmListView({Key key, @required this.title, @required this.films}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Text(title, style: Theme.of(context).textTheme.subtitle2),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: films.length,
              itemBuilder: (BuildContext context, int index){
                return FilmCard(
                  file: films[index],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class FilmCard extends StatelessWidget {
  
  final String file;

  static const filePath = 'images/';

  const FilmCard({Key key, @required this.file}): super (key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.blueGrey[800],
        boxShadow: [BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          offset: Offset(4, 5),
          blurRadius: 5,
        )]
      ),
      child: InkWell(
        onTap: (){
          // Подробнее о книге
        },
        child: Image.asset(filePath+file),
      ),
    );
  }
}

class CustomBunner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
          height: 60.0,
          child: Text(
            'Фильмы',
            // style: Theme.of(context).textTheme.headline6,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ) 
        ),
      ),
    );
  }
}

// class _FilmsState extends State<Films> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: new SingleChildScrollView(
//         child: new Column(
//           children: <Widget>[
//             new Container(
//               margin: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
//               // child: new Image(image: AssetImage('images/piraty_karibskogo_morya.jpg')),
//               child: new ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: new Image(
//                     image: AssetImage('images/piraty_karibskogo_morya.jpg')),
//               ),
//             ),
//             new Container(
//               margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
//               // child: new Image(image: AssetImage('images/ZooTropolis.jpg')),
//               child: new ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: new Image(image: AssetImage('images/ZooTropolis.jpg')),
//               ),
//             ),
//             new Container(
//               margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
//               // child: new Image(image: AssetImage('images/Avengers.webp')),
//               child: new ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: new Image(image: AssetImage('images/Avengers.webp')),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
