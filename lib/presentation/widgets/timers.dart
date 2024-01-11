import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/timer_model.dart';
import 'package:odoo/logic/bloc/timer_bloc.dart';
import 'package:odoo/presentation/screens/task_details_screen.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
import 'package:odoo/presentation/widgets/playPause_button.dart';
import 'package:odoo/ticker.dart';

class Timers extends StatefulWidget {
  const Timers({super.key});

  @override
  State<Timers> createState() => _TimersState();
}

class _TimersState extends State<Timers> {
  final List<bool> timerPlayPauseList = List.generate(16, (index) => false);

  @override
  Widget build(BuildContext context) {
    final List<TimersData> _content = Helper.getTimersData();
    return ListView.builder(
        itemCount: _content.length,
        itemBuilder: (context, index) {
          return index == 0
              ? _buildHeader(context)
              : _buildTimerItem(context, index, _content);
        });
  }

  Padding _buildTimerItem(
      BuildContext context, int index, List<TimersData> _content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: InkWell(
        onTap: () {
          _navigateToTaskDetails(context, index);
        },
        child: BlocProvider(
          create: (context) => TimerBloc(ticker: Ticker()),
          child: OdooCard(
              height: 136,
              width: 361,
              radius: 16,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10.0,
                ),
                child: Row(children: [
                  SizedBox(
                    height: 114,
                    child: _buildVerticalDivider(),
                  ),
                  const SizedBox(width: 5),
                  _buildTimerItemContent(_content, index, context),
                  const Spacer(),
                  playPauseButton(
                    index,
                    context,
                    timerPlayPauseList[index],
                    (bool isPlaying) {
                      setState(() {
                        timerPlayPauseList[index] = isPlaying;
                      });
                    },
                  )
                ]),
              )),
        ),
      ),
    );
  }

  void _navigateToTaskDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailsScreen(
          index: index,
        ),
      ),
    );
  }

  SizedBox _buildTimerItemContent(
      List<TimersData> _content, int index, BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('lib/assets/icons/1.png'),
              const SizedBox(width: 10),
              SizedBox(
                width: 180,
                child: Text(
                  _content[index].name,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset('lib/assets/icons/3.png'),
              const SizedBox(width: 10),
              Text(
                _content[index].details,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          Row(
            children: [
              Image.asset('lib/assets/icons/4.png'),
              const SizedBox(width: 10),
              Text(
                _content[index].deadline,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ],
      ),
    );
  }

  VerticalDivider _buildVerticalDivider() {
    return const VerticalDivider(
      color: Color(0xffFFC629),
      width: 20,
      thickness: 2,
      indent: 2,
      endIndent: 2,
    );
  }

  Padding _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      ),
      child: Text(
        'You have 16 Timers',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
