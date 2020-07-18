import 'package:flutter/material.dart';
import 'package:flutter_localization_app/routes/custom_router.dart';
import './routes/custom_router.dart';
import './routes/route_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,

    );
  }
}
