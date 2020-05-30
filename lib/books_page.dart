import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundGradient(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomBunner(),
              BookListView(
                title: 'Детективы',
                books: [
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
                ],
              ),
              BookListView(
                title: 'Приключения',
                books: [
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
                ],
              ),
              BookListView(
                title: 'Классика',
                books: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookListView extends StatelessWidget {
  final String title;
  final List<String> books;

  const BookListView({Key key, @required this.title, @required this.books}) : super(key:key);
  
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
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index){
                return BookCard(
                  file: books[index],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  
  final String file;

  static const filePath = 'images/';

  const BookCard({Key key, @required this.file}): super (key:key);

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
      // child: Image.asset(filePath + file),
      child: InkWell(
        onTap: (){
          // Подробнее о книге
        },
        child: Image.asset(filePath+file),
      ),
    );
  }
}

BoxDecoration backgroundGradient(){
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.mirror,
        stops: [0.0, 0.4, 0.6, 1],
        colors: [
          Colors.blueGrey[800],
          Colors.blueGrey[700],
          Colors.blueGrey[700],
          Colors.blueGrey[800],
        ]
    )
  );
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
            'Книги',
            // style: Theme.of(context).textTheme.headline6,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ) 
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter{


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