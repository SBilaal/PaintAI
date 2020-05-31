import 'package:flutter/material.dart';
import 'package:paint_ai/pages/appraised_art_page.dart';
import 'package:paint_ai/pages/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppraisedArtPage.AppraisedArtPageRoute: (BuildContext context) => AppraisedArtPage(),
  '/': (BuildContext context) => MyHomePage(title: 'Paint.AI',),
};