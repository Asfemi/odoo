import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/empty_data.dart';
import 'package:odoo/presentation/widgets/timers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  void _showModalBottomSheet() {
    late int? selectedOption = 1;
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
                      Text('Sort by',
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 10),
                      ListTile(
                        title: Text(
                          'Recent',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        leading: Radio<int?>(
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Theme.of(context).dividerColor,
                      ),
                      ListTile(
                        title: Text(
                          'Oldest',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        leading: Radio<int>(
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Timesheets',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          InkWell(
            onTap: () {
              _showModalBottomSheet();
            },
            child: Image.asset(
              'lib/assets/icons/Frame 16.png',
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/CreateTimer');
            },
            child: Image.asset(
              'lib/assets/icons/Frame 17.png',
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Favorites',
            ),
            Tab(text: 'Odoo'),
            Tab(text: 'Local'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          EmptyData(index: 0),
          Timers(),
          EmptyData(index: 2),
        ],
      ),
    );
  }
}
