import 'dart:io';

import 'package:tflite/tflite.dart';

class Appraisal {
  final String model = '';
  final String labels = '';
  List<double> appraisals = [];

  void loadModel() async {
    Tflite.close();
    await Tflite.loadModel(model: model, labels: labels);
  }

  void runModel(File file) async {
    if (file != null) {
      appraisals = await Tflite.runModelOnImage(
          path: file.path,
          imageMean: 0.0,
          imageStd: 255.0,
          numResults: 3,
          threshold: 0.0);
    }
  }
}
