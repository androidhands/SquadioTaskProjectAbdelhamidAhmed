import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:squadio_task_project_abdelhamid_hamed/app_injection_container.dart';

import 'routing/routing.gr.dart';

void main() async {
  init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(_appRouter),
        theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}


