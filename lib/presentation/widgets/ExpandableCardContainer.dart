

import 'package:flutter/material.dart';

class ExpandableCardContainer extends StatelessWidget {
  final bool isExpanded;
  final Widget collapsedChild;
  final Widget expandedChild;

  const ExpandableCardContainer(
      {super.key,   required this.isExpanded, required this.collapsedChild, required this.expandedChild})
      ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: isExpanded ? expandedChild : collapsedChild,
        ),
       const SizedBox(height: 10),
      ],
    );
  }
}