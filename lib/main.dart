import 'package:flutter/material.dart';
import 'package:odoo/presentation/router/app_router.dart';
import 'package:odoo/presentation/screens/comfig.dart';
import 'package:odoo/theme/theme.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), ));
}

class MyApp extends StatelessWidget {
 MyApp({required this.appRouter, super.key});
final AppRouter appRouter;
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odoo',
      theme: CustomTheme.lightTheme, 
      darkTheme: CustomTheme.darkTheme, 
      themeMode: currentTheme.currentTheme, 
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
