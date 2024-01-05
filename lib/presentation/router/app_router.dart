
import 'package:flutter/material.dart';
import 'package:odoo/presentation/pages/home_page.dart';
import 'package:odoo/presentation/screens/create_timer_screen.dart';

import 'package:odoo/presentation/screens/splash_screen.dart';
import 'package:odoo/presentation/screens/task_details_screen.dart';

class AppRouter {
  

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) =>  const HomePage(),
        );
        case '/TaskDetails':
        return MaterialPageRoute(
          builder: (_) =>  const TaskDetailsScreen(),
        );
      case '/CreateTimer':
        return MaterialPageRoute(
          builder: (_) => const CreateTimer(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>  SplashScreen(),
        );
    }
  }

  
}
