import 'package:flutter/material.dart';
import 'package:task/constants/default_colors.dart';

class RightTopCustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
     
  Paint paint_0 = new Paint()
      ..color = DefaultColors.kOrange
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
         
    Path path_0 = Path();
    // path_0.moveTo(0,0);
    // path_0.lineTo(size.width*0.8344444,0);
    // path_0.lineTo(size.width*0.8311111,size.height * 4.5*0.1675000);
    // path_0.quadraticBezierTo(size.width*0.8356944,size.height * 4.5*0.2350000,size.width*0.6950000,size.height * 4.5*0.2350000);
    // path_0.cubicTo(size.width*0.5547222,size.height * 4.5*0.2350000,size.width*0.2786111,size.height * 4.5*0.2337500,size.width*0.1361111,size.height * 4.5*0.2318750);
    // path_0.quadraticBezierTo(size.width*-0.0045833,size.height * 4.5*0.2353906,0,size.height * 4.5*0.3062500);
    
    path_0.moveTo(0,0);
    path_0.lineTo(size.width*0.8344444,0);
    path_0.quadraticBezierTo(size.width*0.8336111,size.height*0.1476211,size.width*0.8333333,size.height*0.1968281);
    path_0.quadraticBezierTo(size.width*0.8341389,size.height*0.2715000,size.width*0.6946944,size.height*0.2737188);
    path_0.quadraticBezierTo(size.width*0.2757569,size.height*0.2740117,size.width*0.1361111,size.height*0.2741094);
    path_0.quadraticBezierTo(size.width*0.0110833,size.height*0.2778281,0,size.height*0.3515625);
    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BackgroundCustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      // ..color = Colors.green
      ..color = DefaultColors.kBlue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width,0);
    path_0.lineTo(size.width,0);
    path_0.quadraticBezierTo(size.width*0.9971944,size.height*0.3413000,size.width*0.9055556,size.height*0.3500000);
    path_0.cubicTo(size.width*0.7208333,size.height*0.3500000,size.width*0.2958333,size.height*0.3500000,size.width*0.0972222,size.height*0.3500000);
    path_0.quadraticBezierTo(size.width*0.0186667,size.height*0.3547000,0,size.height*0.6173000);
    path_0.lineTo(0,0);


    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}