import 'package:flutter/material.dart';

class BouncingCircle {
  Offset position;
  Offset velocity;
  double radius;
  Color color;

  BouncingCircle({
    required this.position,
    required this.velocity,
    required this.radius,
    required this.color,
  });
}

late List<BouncingCircle> circles;

void initCircles(Size size) {
  circles = List.generate(6, (i) {
    final rand = i * 100;
    return BouncingCircle(
      position: Offset(50.0 + rand % size.width, 100.0 + rand % size.height),
      velocity: Offset((2.0 + i) / 6, (2.5 + i) / 6),
      radius: 30.0 + (i * 8),
      // ignore: deprecated_member_use
      color: Colors.green.shade800.withOpacity(0.5),
    );
  });
}

void updateCircles(Size size) {
  for (var circle in circles) {
    var pos = circle.position + circle.velocity;
    if (pos.dx - circle.radius < 0 || pos.dx + circle.radius > size.width) {
      circle.velocity = Offset(-circle.velocity.dx, circle.velocity.dy);
    }
    if (pos.dy - circle.radius < 0 || pos.dy + circle.radius > size.height) {
      circle.velocity = Offset(circle.velocity.dx, -circle.velocity.dy);
    }
    circle.position += circle.velocity;
  }
}

class CirclesPainter extends CustomPainter {
  final List<BouncingCircle> circles;
  CirclesPainter(this.circles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var circle in circles) {
      final paint = Paint()..color = circle.color;
      canvas.drawCircle(circle.position, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}