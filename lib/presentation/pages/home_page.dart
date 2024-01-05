import 'package:flutter/material.dart';
import 'package:odoo/presentation/screens/timesheets_screen.dart';
import 'package:odoo/presentation/screens/projects_screen.dart';
import 'package:odoo/presentation/screens/settings_screen.dart';
import 'package:odoo/presentation/widgets/Onavbar.dart';
import 'package:odoo/presentation/widgets/background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = 'home page things';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            ProjectsScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar:
            CBottomNavigationBar(context, _currentIndex, _onItemTapped),
      ),
    );
  }
}
