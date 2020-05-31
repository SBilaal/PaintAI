import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paint_ai/view_models/appraisal_model.dart';
import 'package:provider/provider.dart';

class GalleryTab extends StatelessWidget {
  // Temporary bool
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppraisalModel>();
    return isEmpty
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 64),
            child: ListView(
              children: <Widget>[
                ArtWorkCard(image: 'assets/apple.jpg', price: 2000),
                ArtWorkCard(image: 'assets/apple.jpg', price: 2000),
              ],
            ),
          )
        : Container();
  }
}

class ArtWorkCard extends StatelessWidget {
  final String image;
  final int price;

  ArtWorkCard({this.image, this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(fit: StackFit.passthrough, children: <Widget>[
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            constraints: BoxConstraints.tightFor(height: 50),
            color: Colors.red.withOpacity(0.6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Price:',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '\$$price',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor)),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
