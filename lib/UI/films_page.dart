import 'package:flutter/material.dart';
import 'package:less_projects/UI/books_page.dart';
import 'package:less_projects/UI/widgets/item.dart';

class Films extends StatelessWidget {
  List<String> films = [
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
  ];
  @override
  //TODO: Добавить блокКонсумер
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: backgroundGradient(),
          child: SingleChildScrollView(
            child: Column(
              children: getListOfItems(films: films, context: context),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getListOfItems({List<String> films, BuildContext context}) {
  double width = MediaQuery.of(context).size.width * 0.6;
  double height = MediaQuery.of(context).size.height * 0.4;
  List<Widget> result = new List<Widget>();
  result.add(CustomBanner());
  films.forEach((film) => result.add(
        new Item(
          height: height,
          width: width,
          name: film,
          isBook: false,
          image: AssetImage('images/' + film),
        ),
      ));
  print(result.length);
  return result;
}

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              'Книги',
              // style: Theme.of(context).textTheme.headline6,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
