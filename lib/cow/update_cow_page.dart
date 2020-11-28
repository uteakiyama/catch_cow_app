import 'package:catch_cow_app/cow/cow_view_model.dart';
import 'package:catch_cow_app/cow/cows_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cow.dart';

class UpdateCowPage extends StatelessWidget {
  final CowViewModel model;
  UpdateCowPage(this.model);
  // UpdateCowPage(this.cow);
  // final Cow cow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規追加'),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: model.cowNumber,
            onChanged: (String inputCowNumber) {
              // cow.changeCowNumber(inputCowNumber);
            },
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            child: Text('追加する'),
            onPressed: () async {
              // firestoreに値を追加する
              // await Firestore.instance
              //     .collection('cows')
              //     .document()
              //     .updateData(
              //   {
              //     'cowNumber': model.cowNumber,
              //   },
              // );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
