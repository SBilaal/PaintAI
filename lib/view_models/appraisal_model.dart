import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paint_ai/usecases/appraisal.dart';

class AppraisalModel extends ChangeNotifier {
  File _image;
  Appraisal appraisal;
  bool _isLoading = false;
  bool _isImageSelected = false;

  bool get isImageSelected {
    return _isImageSelected;
  }

  set isImageSelected(bool isImageSelected) {
    _isImageSelected = isImageSelected;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool isLoadingn) {
    _isLoading = isLoadingn;
    notifyListeners();
  }

  File get image {
    return _image;
  }

  void chooseImage(ImageSource imageSource) async {
    
    _image = await ImagePicker.pickImage(source: imageSource);
    if (_image != null) {

      isImageSelected = true; 
    }
    else {
      isImageSelected = false;
    }
  }

  Future<void> runTfliteModel() async {
    appraisal = Appraisal();
    await appraisal?.loadModel();
    await appraisal?.runModel(_image);
    appraisal.appraisals.forEach((result) => print(result));
  }
}