import 'package:flutter/material.dart';
import 'package:odoo/constants/constants.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kGradient,
      ),
      child: child,
    );
  }
}
