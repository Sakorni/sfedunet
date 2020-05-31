import 'package:flutter/material.dart';
import 'package:less_projects/UI/widgets/item.dart';

class Books extends StatelessWidget {
  List<String> books = [
    '10_nigret.jpg',
    'bezmolv_pacient.jpg',
    'face_with_shram.jpg',
    'five_five.jpg',
    'girl_in_train.webp',
    'i_find_you.jpg',
    'sherlok_holmse.jpg',
    'telefonist.jpg',
    'the_one.jpg',
    'dnk_geniya.jpg',
    'harry.jpg',
    'harry1.png',
    'harry2.jpeg',
    '20_tis_lye_pod_vodoy.jpg',
    'beliy_klik.jpg',
    'dva_capitana.jpg',
    'tainstven_ostrov.jpg',
    'tri_mushketera.jpg',
    'dvacyat_let_spustya.jpg',
    'deti_kapitana_granta.jpg',
    '1984.jpg',
    'jack_london.jpg',
    '451_po_fareng.jpg',
    'belaya_gvardiya.jpg',
    'finansist.jpg',
    'kriscniy_otec.jpg',
    'morskoy_volk.jpg',
    'nad_propastyu_vo_rzi.jpg',
    'zov_predkov.jpg',
    'vsadnic_bez_golovi.jpg',
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
              children: getListOfItems(books: books, context: context),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getListOfItems({List<String> books, BuildContext context}) {
  double width = MediaQuery.of(context).size.width * 0.6;
  double height = MediaQuery.of(context).size.height * 0.4;
  List<Widget> result = new List<Widget>();
  result.add(CustomBanner());
  books.forEach((book) => result.add(
        new Item(
          height: height,
          width: width,
          name: book,
          isBook: true,
          image: AssetImage('images/' + book),
        ),
      ));
  print(result.length);
  return result;
}

BoxDecoration backgroundGradient() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.mirror,
          stops: [
        0.0,
        0.4,
        0.6,
        1
      ],
          colors: [
        Colors.blueGrey[800],
        Colors.blueGrey[700],
        Colors.blueGrey[700],
        Colors.blueGrey[800],
      ]));
}

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 20.0),
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

// class _BooksState extends State<Books> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: new SingleChildScrollView(
//         child: new Column(
//           children: <Widget>[
//             new Container(
//               margin: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
//               child: new ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: new Image(image: AssetImage('images/1984.jpg')),
//               ),
//             ),
//             new Container(
//               margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
//               child: new ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: new Image(image: AssetImage('images/jack_london.jpg')),
//               ),
//             ),
//             new Container(
//               margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
//               child: new ClipRRect(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child:
//                     new Image(image: AssetImage('images/sherlok_holmse.jpg')),
//               ),
//             ),
//             BookListView(
//               title: 'YOUR TITLES',
//               books: [
//                 '1984.jpg',
//                 'ijack_london.jpg',
//                 'sherlok_holmse.jpg'
//                 ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
}
