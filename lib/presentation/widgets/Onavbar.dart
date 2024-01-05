// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

BottomNavigationBar CBottomNavigationBar(
  BuildContext context,
  int currentIndex,
  Function(int) onItemTapped,
) {
  return BottomNavigationBar(
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    // selectedItemColor: Colors.white,
    // unselectedItemColor: Colors.grey,
    currentIndex: currentIndex,
    onTap: onItemTapped,
    items: const [
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("lib/assets/icons/timesheetsSelected.png"),
        ),
        label: 'Timesheets',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("lib/assets/icons/projectsUnselected.png"),
        ),
        label: 'Projects',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("lib/assets/icons/settingsUnselected.png"),
        ),
        label: 'Settings',
      ),
    ],
  );
}
