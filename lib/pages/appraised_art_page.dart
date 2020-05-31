import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:paint_ai/view_models/appraisal_model.dart';
import '../widgets/image_widget.dart';

class AppraisedArtPage extends StatelessWidget {
  static const AppraisedArtPageRoute = '/appraised_art_page_route';

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppraisalModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Appraised Art',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageWidget(model.image),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Price:'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  /**model.appraisal?.appraisals[0]?.toString()**/'2000',
                  style: TextStyle(color: Colors.black87),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.3, color: Theme.of(context).primaryColor)),
              )
            ],
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: RaisedButton(
              elevation: 0.0,
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text('Sell'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
