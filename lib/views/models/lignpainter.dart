import 'package:flutter/material.dart';

   class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.7) // Line color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Starting point (just below the first image)
    path.moveTo(size.width / 2, size.height * 0.25);
    
    // Draw a curve to the second image area
    path.quadraticBezierTo(
      size.width / 2, size.height * 0.33, // Control point
      size.width / 2, size.height * 0.4,  // End point
    );
    
    // Draw a curve to the third image area
    path.moveTo(size.width / 2, size.height * 0.6); // Start new line
    path.quadraticBezierTo(
      size.width / 2, size.height * 0.67, // Control point
      size.width / 2, size.height * 0.75, // End point
    );

    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}