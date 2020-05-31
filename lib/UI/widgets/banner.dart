import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  final String caption;

  const MyBanner({Key key, @required this.caption}) : super(key: key);
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
}
