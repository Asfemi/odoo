import 'package:flutter/material.dart';
import 'package:odoo/constants/constants.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: kGradient,
      ),
      child: child,
    );
  }
}
