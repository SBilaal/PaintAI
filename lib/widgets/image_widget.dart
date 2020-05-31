import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paint_ai/view_models/appraisal_model.dart';

class ImageWidget extends StatelessWidget {
  final File file;

  ImageWidget(this.file);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: file != null ? Image.file(
        file,
        fit: BoxFit.cover,
      ) : Image.asset(
        'assets/apple.jpg',
        fit: BoxFit.cover,
      ), 
    );
  }
}
