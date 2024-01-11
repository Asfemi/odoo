import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/TimeSheetActions.dart';
import 'package:odoo/presentation/widgets/TimerText.dart';

Widget playPauseButton(index, context, bool isPlaying, Function(bool) onToggle) {
    return OutlinedButton(
        onPressed: () {
         onToggle(!isPlaying);
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            fixedSize: const Size(104, 48),
            side: const BorderSide(
              color: Colors.transparent,
            ),
            backgroundColor: isPlaying
            ? Colors.white
            : Colors.white.withOpacity(0.07999999821186066),
            shape: const StadiumBorder()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerText(
              style: TextStyle(
                color: isPlaying
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).indicatorColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
             TImeSheetActions(light: isPlaying, onToggle: (bool ) {onToggle(!isPlaying);  }, ),
          ],
        ));
  
}
