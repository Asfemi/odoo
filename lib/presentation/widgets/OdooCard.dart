import 'dart:ui';

import 'package:flutter/material.dart';

class OdooCard extends StatelessWidget {
  const OdooCard({
    required this.child,
    required this.height,
    required this.width,
    required this.radius,
    super.key,
  });

  final double height;
  final double width;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        // padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
