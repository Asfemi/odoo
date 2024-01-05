import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/background.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
            //name should be task title
            'Get to know Apexer - Ivan',
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
          children: const [
            Column(),
            Column(),
          ],
        ),
      ),
    );
  }
}
