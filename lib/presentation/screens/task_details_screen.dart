import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/task_models.dart';
import 'package:odoo/data/models/timer_model.dart';
import 'package:odoo/presentation/widgets/ExpandableCardContainer.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
import 'package:odoo/presentation/widgets/background.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({required this.index, super.key});

  final int index;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isExpanded = false;

  final List<TimersData> _content = Helper.getTimersData();
  final List<TaskData> _completedcontent = Helper.getTaskData();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  void _showModalBottomSheet() {
    //TODO refactor this code and the one in timesheets screen

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        Size size = MediaQuery.sizeOf(context);
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
                            'Recent',
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BackgroundGradient(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ImageIcon(
                  AssetImage('lib/assets/icons/Frame 300.png'))),
          backgroundColor: Colors.transparent,
          title: Text(
            _content[widget.index].name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            InkWell(
              onTap: () {
                _showModalBottomSheet();
              },
              child: Image.asset(
                'lib/assets/icons/Icons.png',
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Timesheets',
              ),
              Tab(text: 'Details'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                OdooCard(
                    height: size.height * 0.3,
                    width: size.width,
                    radius: 16,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _content[widget.index].taskdetails.day,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            _content[widget.index].taskdetails.date,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            _content[widget.index].taskdetails.startTime,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _content[widget.index].taskdetails.duration,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'lib/assets/icons/Frame 301.png',
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'lib/assets/icons/Frame 299.png',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(
                            height: 0.5,
                            thickness: 0.5,
                            color: Theme.of(context).dividerColor,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'lib/assets/icons/Frame 299b.png',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _content[widget.index].taskdetails.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Read More',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                Text(
                  'Completed Records',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 5),
                ListView.builder(itemBuilder: (context, index) {
                  return ExpandableCardContainer(
                    expandedChild: createExpandedColumn(context, index),
                    collapsedChild: createCollapsedColumn(context, index),
                    isExpanded: isExpanded,
                  );
                }),
              ],
            ),
            const Column(),
          ],
        ),
      ),
    );
  }

  createCollapsedColumn(BuildContext context, int index) {
    return OdooCard(
      height: 96,
      width: 361,
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/icons/Frame 26.png',
            ),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _completedcontent[index].day,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  _completedcontent[index].date,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  _completedcontent[index].startTime,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const Spacer(),
             
          ],
        ),
      ),
    );
  }

  createExpandedColumn(BuildContext context, int index) {}
}
