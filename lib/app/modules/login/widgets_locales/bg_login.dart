import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: CustomPaint(
        painter: _Painter(),
      ),
    );
  }
}

class BackgroundLogin2 extends StatelessWidget {
  const BackgroundLogin2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: CustomPaint(
        painter: _Painter2(),
      ),
    );
  }
}

class BackgroundLogin3 extends StatelessWidget {
  const BackgroundLogin3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: CustomPaint(
        painter: _Painter3(),
      ),
    );
  }
}

class BackgroundLogin4 extends StatelessWidget {
  const BackgroundLogin4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: CustomPaint(
        painter: _Painter4(),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    var rect = const Offset(5, 5) & size;
    lapiz.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        //Colors.blue[900],
        //Colors.blue[600],
        AppColors.primaryColor,
        AppColors.secondaryColor,
      ],
    ).createShader(rect);
    lapiz.style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, size.height * 0.15);

    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 0.25,
    );

    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.24,
      size.width,
      size.height * 0.40,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _Painter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz2 = Paint();
    // var rect = Offset(5, 5) & size;

    lapiz2.color = AppColors.secondaryColor;
    lapiz2.style = PaintingStyle.fill;

    final path2 = Path();
    path2.lineTo(0, size.height * 0.165);
    path2.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.268,
      size.width * 0.5,
      size.height * 0.27,
    );

    path2.quadraticBezierTo(
      size.width * 0.86,
      size.height * 0.24,
      size.width,
      size.height * 0.42,
    );
    path2.lineTo(size.width, 0);
    canvas.drawPath(path2, lapiz2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _Painter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz2 = Paint();
    //var rect = Offset(5, 5) & size;

    lapiz2.color = AppColors.primaryColor;
    lapiz2.style = PaintingStyle.fill;

    final path2 = Path();
    path2.lineTo(0, size.height * 0.65);

    path2.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.80,
      size.width,
      size.height * 0.65,
    );
    path2.lineTo(size.width, 0);
    canvas.drawPath(path2, lapiz2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _Painter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz2 = Paint();
    //var rect = Offset(5, 5) & size;

    lapiz2.color = AppColors.primaryColor;
    lapiz2.style = PaintingStyle.fill;

    final path2 = Path();
    path2.lineTo(0, size.height * 0.4);

    path2.quadraticBezierTo(
      size.width,
      size.height * 0.4,
      size.width,
      size.height * 0.4,
    );
    path2.lineTo(size.width, 0);
    canvas.drawPath(path2, lapiz2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
