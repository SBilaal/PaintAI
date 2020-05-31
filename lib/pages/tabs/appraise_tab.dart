import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paint_ai/pages/appraised_art_page.dart';
import 'package:paint_ai/view_models/appraisal_model.dart';
import 'package:provider/provider.dart';

class AppraiseTab extends StatefulWidget {
  @override
  _AppraiseTabState createState() => _AppraiseTabState();
}

class _AppraiseTabState extends State<AppraiseTab> {
  bool hasBeenAppraised = false;

  Widget _selectImageRetrievalMethod(BuildContext context, AppraisalModel model) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.fromLTRB(8, 20, 24, 20),
            title: Text('Load the image', ),
            content: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => runAIModel(ImageSource.gallery, model),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Load image from device'),
                          Icon(Icons.storage, color: Colors.red,),
                        ]),
                  ),
                  FlatButton(
                    onPressed: () => runAIModel(ImageSource.camera, model),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Take a picture'),
                        Icon(Icons.camera, color: Colors.red,),
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('CANCEL'))
            ],
          );
        }
    );
  }

  void runAIModel(
      ImageSource imageSource, AppraisalModel model) {
    model.chooseImage(imageSource);

    if (!model.isImageSelected) {
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
      return;
    }

    setState(() {
      model.isLoading = true;
      Navigator.of(context).pushNamed(AppraisedArtPage.AppraisedArtPageRoute);
      // model.runTfliteModel().then((onValue) {
      //   model.isLoading = false;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppraisalModel>();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        hasBeenAppraised
            ? Column()
            : Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Upload or take a picture of an artwork for appraisal',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black38),
                  ),
                ),
              ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: IconButton(
            splashColor: Colors.red[100],
            iconSize: 60,
            color: Colors.red,
            icon: Icon(Icons.camera),
            onPressed: () {
              _selectImageRetrievalMethod(context, model);
            },
          ),
        ),
      ],
    );
  }
}
