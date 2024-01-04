
import 'package:flutter/material.dart';
import 'package:odoo/presentation/screens/home_screen.dart';
import 'package:odoo/presentation/screens/splashscreen.dart';

class AppRouter {
  

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) =>  const HomeScreen(),
        );
      // case '/third':
      //   return MaterialPageRoute(
      //     builder: (_) => const ,
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) =>  SplashScreen(),
        );
    }
  }

  
}
