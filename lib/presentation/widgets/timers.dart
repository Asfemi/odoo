import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
import 'package:odoo/presentation/widgets/playPause_button.dart';

class Timers extends StatelessWidget {
  const Timers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
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
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/TaskDetails');
              },
              child: OdooCard(
                  height: 112,
                  width: 361,
                  radius: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 10.0,
                    ),
                    child: Row(children: [
                      const SizedBox(
                        height: 90,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('lib/assets/icons/1.png'),
                                const SizedBox(width: 10),
                                Text(
                                  'iOS app deployment',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset('lib/assets/icons/3.png'),
                                const SizedBox(width: 10),
                                Text(
                                  'SO056 - Booqio V2',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset('lib/assets/icons/4.png'),
                                const SizedBox(width: 10),
                                Text(
                                  'Deadline 07/20/2023',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      //const SizedBox(width: 5),
                      Spacer(),
                      playPauseButton(index, context)
                    ]),
                  )),
            ),
          );
        });
  }
}
