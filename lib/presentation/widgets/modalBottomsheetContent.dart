import 'dart:ui';

import 'package:flutter/material.dart';

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({
    required this.size,
    super.key});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff214ECC),
            const Color(0xff214ECC).withOpacity(0.7)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1,
              sigmaY: 1,
            ),
            child: Container(
              height: size.height * 0.25,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: Colors.white.withOpacity(0.1)),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              height: size.height * 0.25,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      title: Text(
                        'Delete',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: const ImageIcon(
                          AssetImage('lib/assets/icons/Frame 19.png'))),
                  Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: Theme.of(context).dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      'Favourite',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    leading: const ImageIcon(
                        AssetImage('lib/assets/icons/Frame 191.png')),
                  ),
                  Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
