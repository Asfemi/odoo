import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo/logic/bloc/timer_bloc.dart';
import 'package:odoo/presentation/router/app_router.dart';
import 'package:odoo/theme/comfig.dart';
import 'package:odoo/theme/theme.dart';
import 'package:odoo/ticker.dart';

void main() {
 FlutterError.onError = (FlutterErrorDetails details) {
    
    log('Global Flutter error: ${details.exception}');
  };

  runZonedGuarded(() {
    runApp(MyApp(appRouter: AppRouter(),));
  }, (Object error, StackTrace stackTrace) {
   
    log('Uncaught error: $error');
  });
}

class MyApp extends StatelessWidget {
  MyApp({required this.appRouter, super.key});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: Ticker()),
      child: MaterialApp(
        title: 'Odoo',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
