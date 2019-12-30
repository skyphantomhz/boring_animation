import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const CURVE_HEIGHT = 200.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class CuveredShape extends StatefulWidget {
  const CuveredShape({Key key}) : super(key: key);

  @override
  _CuveredShapeState createState() => _CuveredShapeState();
}

class _CuveredShapeState extends State<CuveredShape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: CURVE_HEIGHT,
            child: CustomPaint(
              painter: _MyPainter(),
            ),
          ),
          Container(
              child: RaisedButton(
                child: Text("Change"),
                onPressed: () {
                  setState(() {});
                },
            ),
          )
        ],
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  Paint painter = new Paint()
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 5
    ..color = Colors.purple[700]
    ..strokeJoin = StrokeJoin.round
    ..strokeCap = StrokeCap.round;

  Paint painterPoint = new Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.grey;
  @override
  void paint(Canvas canvas, Size size) {
    double pointRadius = 5;
    double spanBetween = 30;
    double controlToPoint = spanBetween / 2;
    var data = List<Offset>();

    var indicator = 0.0;
    while (indicator < size.width) {
      var value = Random().nextDouble();
      data.add(Offset(indicator, value * size.height));
      indicator += spanBetween;
    }

    data.asMap().forEach((index, value) {
      if (index != 0) {
        Path path = Path();
        path.moveTo(data[index - 1].dx, data[index - 1].dy);
        var controlPoint1dx = data[index - 1].dx + controlToPoint;
        var controlPoint1dy = data[index - 1].dy;
        var controlPoint2dx = data[index].dx + controlToPoint * (-1);
        var controlPoint2dy = data[index].dy;
        path.cubicTo(controlPoint1dx, controlPoint1dy, controlPoint2dx,
            controlPoint2dy, data[index].dx, data[index].dy);
        canvas.drawPath(path, painter);
      }
      // canvas.drawCircle(Offset(value.dx, value.dy), pointRadius, painterPoint);
    });

    // Path path = Path();
    // ..moveTo(0, 0)
    // ..lineTo(50, 10)
    // ..lineTo(80, 100)
    // ..lineTo(140, 30)
    // ..lineTo(160, 20)
    // ..lineTo(250, 200);

    // ..moveTo(0, 0)
    // ..conicTo(50, 10, 80, 100, 0.5)
    // ..conicTo(80, 100, 140, 30,0.5)
    // ..cubicTo(140, 30, 160, 20,0.5);
    // ..lineTo(250,200);
    // ..moveTo(0, 0)
    // ..cubicTo(50, 10, 80, 100)
    // ..conicTo(80, 100, 160, 20, radius)
    // ..conicTo(160, 20,200, 0, radius);
    //   ..conicTo(160, 20, 200, 0, radius)
    //   // ..lineTo(160, 20)
    //   ..conicTo(200, 0, 240, 300, radius);
    // ..lineTo(240, 300);

    // path.conicTo(size.width / 4, 3 * size.height / 4, size.width, size.height, 20);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
