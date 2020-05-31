import 'package:flutter/material.dart';
import 'package:paint_ai/routes.dart';
import 'package:paint_ai/view_models/appraisal_model.dart';
import 'package:provider/provider.dart';

import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyMaterialApp();
  }
}

class MyMaterialApp extends StatelessWidget {
  final providers = [
    ChangeNotifierProvider(create: (BuildContext context) => AppraisalModel())
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Paint.AI',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes,
      ),
    );
  }
}
