import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo/logic/bloc/timer_bloc.dart';

// class TImeSheetActions extends StatelessWidget {
//   const TImeSheetActions({required this.light, super.key});

//   final bool light;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TimerBloc, TimerState>(
//       buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
//       builder: (context, state) {
//         if (state is TimerInitial) {
//           return IconButton(
//             icon: Icon(
//               Icons.play_arrow,
//               color: light ? Colors.black : Colors.white,
//             ),
//             onPressed: () => context
//                 .read<TimerBloc>()
//                 .add(TimerStarted(duration: state.duration)),
//           );
//         } else if (state is TimerRunInProgress) {
//           return IconButton(
//             icon: Icon(
//               Icons.pause,
//               color: light ? Colors.black : Colors.white,
//             ),
//             onPressed: () => context.read<TimerBloc>().add(const TimerPaused()),
//           );
//         } else if (state is TimerRunPause) {
//           return IconButton(
//             icon: Icon(
//               Icons.play_arrow,
//               color: light ? Colors.black : Colors.white,
//             ),
//             onPressed: () =>
//                 context.read<TimerBloc>().add(const TimerResumed()),
//           );
//         } else if (state is TimerRunComplete) {
//           return IconButton(
//             icon: Icon(
//               Icons.replay,
//               color: light ? Colors.black : Colors.white,
//             ),
//             onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
//           );
//         } else {
//           // Return a default widget or null for other states
//           return Container();
//         }
//       },
//     );
//   }
// }

class TImeSheetActions extends StatelessWidget {
  const TImeSheetActions({
    required this.light,
    required this.onToggle,
    super.key,
  });

  final bool light;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        if (state is TimerInitial) {
          return IconButton(
              icon: Icon(
                Icons.play_arrow,
                color: light ? Colors.black : Colors.white,
              ),
              onPressed: () {
                context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration));
                onToggle(true);
              });
        } else if (state is TimerRunInProgress) {
          return IconButton(
              icon: Icon(
                Icons.pause,
                color: light ? Colors.black : Colors.white,
              ),
              onPressed: () {
                context.read<TimerBloc>().add(const TimerPaused());
                onToggle(false);
              });
        } else if (state is TimerRunPause) {
          return IconButton(
              icon: Icon(
                Icons.play_arrow,
                color: light ? Colors.black : Colors.white,
              ),
              onPressed: () {
                context.read<TimerBloc>().add(const TimerResumed());
                onToggle(true);
              });
        } else if (state is TimerRunComplete) {
          return IconButton(
              icon: Icon(
                Icons.replay,
                color: light ? Colors.black : Colors.white,
              ),
              onPressed: () {
                context.read<TimerBloc>().add(const TimerReset());
                onToggle(true);
              });
        } else {
          return Container();
        }
      },
    );
  }
}
