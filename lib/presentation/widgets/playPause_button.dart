import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
import 'package:odoo/presentation/widgets/TimerText.dart';

Widget playPauseButton(index, context) {
  if (index == 1) {
    return OutlinedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            fixedSize: const Size(104, 48),
            backgroundColor: Colors.white,
            shape: const StadiumBorder()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerText(
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              child: Image.asset(
                'lib/assets/icons/Frame 2.png',
                height: 32,
                width: 32,
              ),
            ),
          ],
        ));
  } else {
    return OdooCard(
      height: 48,
      width: 100,
      radius: 32,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerText(style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 5),
            InkWell( 
              child: Image.asset(
                'lib/assets/icons/Frame 2 light.png',
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

