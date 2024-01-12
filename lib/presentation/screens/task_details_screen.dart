import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/task_models.dart';
import 'package:odoo/data/models/timer_model.dart';
import 'package:odoo/presentation/widgets/ExpandableCardContainer.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
import 'package:odoo/presentation/widgets/background.dart';
import 'package:odoo/presentation/widgets/modalBottomsheetContent.dart';


class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({required this.index, super.key});

  final int index;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<bool> isExpandedList = [];
  
  bool isExpanded = false;

  final List<TimersData> _content = Helper.getTimersData();
  final List<TaskData> _completedcontent = Helper.getTaskData();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    isExpandedList = List.generate(_completedcontent.length, (index) => false);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BackgroundGradient(
      child: Scaffold(
        appBar: taskDetailsAppBar(context, size),
        body: buildTaskTabBar(size, context),
      ),
    );
  }

  void _showModalBottomSheet(Size size) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        Size size = MediaQuery.sizeOf(context);
        return ModalBottomSheetContent(size: size);
      },
    );
  }

  TabBarView buildTaskTabBar(Size size, BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        SizedBox(
          height: size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                OdooCard(
                    height: 281,
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
                SizedBox(
                  height: size.height * 0.45,
                  child: ListView.builder(
                      itemCount: _completedcontent.length,
                      itemBuilder: (listcontext, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isExpandedList[index] = !isExpandedList[index];
                            });
                          },
                          child: ExpandableCardContainer(
                            expandedChild:
                                createExpandedColumn(listcontext, index),
                            collapsedChild:
                                createCollapsedColumn(context, index),
                            isExpanded: isExpandedList[index],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.8,
          child: Column(
            children: [
              OdooCard(
                height: 196,
                width: 361,
                radius: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Color(0xffFFC629),
                              width: 10,
                              thickness: 2,
                              indent: 2,
                              endIndent: 2,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _content[widget.index].taskdetails.project,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Deadline',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _content[widget.index].taskdetails.deadline,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Assigned to',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _content[widget.index].taskdetails.assignedTo,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              OdooCard(
                height: 136,
                width: 361,
                radius: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _content[widget.index].taskdetails.description,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar taskDetailsAppBar(BuildContext context, Size size) {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ImageIcon(AssetImage('lib/assets/icons/Frame 300.png'))),
      backgroundColor: Colors.transparent,
      title: Text(
        _content[widget.index].name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        InkWell(
          onTap: () {
            _showModalBottomSheet(size);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              width: 26,
              height: 26,
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
            const OdooCard(
                height: 32,
                width: 65,
                radius: 64,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    '08:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.10,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  createExpandedColumn(BuildContext context, int index) {
    return OdooCard(
        height: 229,
        width: 361,
        radius: 16,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                _completedcontent[index].description,
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
        ));
  }
}
