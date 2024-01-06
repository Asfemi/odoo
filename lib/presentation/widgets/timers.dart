import 'package:flutter/material.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/timer_model.dart';
import 'package:odoo/presentation/screens/task_details_screen.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
import 'package:odoo/presentation/widgets/playPause_button.dart';

class Timers extends StatelessWidget {
  const Timers({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TimersData> _content = Helper.getTimersData();
    return ListView.builder(
        itemCount: _content.length,
        itemBuilder: (context, index) {
          if (index == 0) {
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
          } else if (index != 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, '/TaskDetails');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskDetailsScreen(
                              index: index,
                            )),
                  );
                },
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
                        const SizedBox(
                          height: 114,
                          child: VerticalDivider(
                            color: Color(0xffFFC629),
                            width: 20,
                            thickness: 2,
                            indent: 2,
                            endIndent: 2,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  )
                                ],
                              ),
                              // const SizedBox(height: 6),
                              Row(
                                children: [
                                  Image.asset('lib/assets/icons/3.png'),
                                  const SizedBox(width: 10),
                                  Text(
                                    _content[index].details,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                              // const SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset('lib/assets/icons/4.png'),
                                  const SizedBox(width: 10),
                                  Text(
                                    _content[index].deadline,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        //const SizedBox(width: 5),
                        const Spacer(),
                        playPauseButton(index, context)
                      ]),
                    )),
              ),
            );
          }
          return null;
        });
  }
}
